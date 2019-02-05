unit LOG200;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Wwdbigrd, Grids, Wwdbgrid, ExtCtrls, db, ComCtrls,
  GridControl, Wwkeycb;

type
  TFRequisicion = class(TForm)
    pnlReqs: TPanel;
    lblTitle: TLabel;
    bvl2: TBevel;
    dbgReqs: TwwDBGrid;
    Z2btnNuevo: TwwIButton;
    pnlbtnAtender: TPanel;
    Z2bbtnOK: TBitBtn;
    Z2bbtnCanc2: TBitBtn;
    Z2bbtnGraba: TBitBtn;
    pnlBusca: TPanel;
    lblBusca: TLabel;
    isBusca: TwwIncrementalSearch;
    procedure Z2btnNuevoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgReqsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgReqsDblClick(Sender: TObject);
    procedure Z2bbtnOKClick(Sender: TObject);
    procedure dbgReqsCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure Z2bbtnCanc2Click(Sender: TObject);
    procedure Z2bbtnGrabaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgReqsCalcTitleAttributes(Sender: TObject;
      AFieldName: String; AFont: TFont; ABrush: TBrush;
      var ATitleAlignment: TAlignment);
    procedure dbgReqsTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure isBuscaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure btnDetalle;
  end;

var
  FRequisicion: TFRequisicion;

implementation

uses LOGDM1, LOG201, oaAD4000;

{$R *.DFM}

procedure TFRequisicion.Z2btnNuevoClick(Sender: TObject);
begin
 if DM1.cdsReqs.State in [dsInsert,dsEdit] then DM1.cdsReqs.Cancel;
 DM1.cdsReqs.Insert;
 DM1.cdsReqs.FieldByName('RQSEST').AsString := 'INICIAL';
 FRegReqs.dblcCIA.Enabled   := True;
 FRegReqs.dbeNumRqs.Enabled := True;

//with DM1 do
//cdsReqs.FieldByName('RQSID').AsString := StrZero(MaxReqs(cdsReqs.FieldByName('CIAID').AsString),8);
//FRegReqs.dbeCntA.Enabled   := False;
//FRegReqs.dbeCntA.Color     := clBtnFace;

 FRegReqs.ShowModal;
end;

procedure TFRequisicion.FormCreate(Sender: TObject);
var
 sSQL : String;
begin
  Left := 0;
  Top  := 0;

  Z2bbtnGraba.Enabled := (DM1.cdsReqs.Modified) or (DM1.cdsReqs.ChangeCount>0);

//dbgReqs.OnCalcCellColors := dbgReqsCalcCellColors;
  dbgReqs.MultiSelectOptions := [msoAutoUnselect,msoShiftSelect];
  dbgReqs.Options := [ dgTitles, dgIndicator, dgColumnResize,
                       dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection,
                       dgConfirmDelete, dgCancelOnExit,
                       dgWordWrap, dgMultiSelect];

  Z2btnNuevo.Enabled     := False;

  with DM1 do
  begin
    sSQL := 'SELECT * FROM LOG308 WHERE RQSEST='+quotedstr('PARCIAL')+' or RQSEST='+quotedstr('ACEPTADO');
    cdsReqs.Close;
    cdsReqs.DataRequest(sSQL);
    cdsReqs.Open;

    cdsDReqs.Close;
    sSQL := 'SELECT * FROM LOG309 ORDER BY CIAID,RQSID,LOCID,ALMID,DRQSID';
    cdsDReqs.DataRequest(sSQL);
    cdsDReqs.MasterSource    := dsReqs;
    cdsDReqs.MasterFields    := 'CIAID;RQSID;LOCID;ALMID';
    cdsDReqs.IndexFieldNames := 'CIAID;RQSID;LOCID;ALMID';
    cdsDReqs.Open;
  end;

end;

procedure TFRequisicion.dbgReqsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=$4D) and (ssCtrl in Shift) then
  begin
    dbgReqsDblClick(nil);
  end;
{if (Key=VK_DELETE) and (ssCtrl in Shift)  then
 begin
    DM1.cdsReqs.Delete;
    FRegReqs.ShowModal;
 end;}

end;

procedure TFRequisicion.dbgReqsDblClick(Sender: TObject);
begin
  if DM1.cdsReqs.RecordCount > 0 then
  begin
    DM1.cdsDReqs.Close;
    DM1.cdsReqs.Edit;
    DM1.cdsDReqs.Open;
    FRegReqs.dblcCIA.Enabled   := False;
    FRegReqs.dbeNumRqs.Enabled := False;
    FRegReqs.dblcLOC.Enabled   := False;
    FRegReqs.ShowModal;
  end;
end;

procedure TFRequisicion.Z2bbtnOKClick(Sender: TObject);
var
 i : Integer;
begin

  with dbgReqs, dbgReqs.datasource.dataset do
  begin
//  DisableControls;
    for i:= 0 to SelectedList.Count-1 do
    begin
      GotoBookmark(SelectedList.items[i]);
      Freebookmark(SelectedList.items[i]);
      Edit;
      if FieldByName('FLAGVAR').AsString = '*' then
         FieldByName('FLAGVAR').AsString := ' '
      else
         FieldByName('FLAGVAR').AsString := '*';
      Post;
    end;
    SelectedList.clear;
//  EnableControls;
  end;

  btnDetalle;

  Z2bbtnGraba.Enabled := (DM1.cdsReqs.Modified) or (DM1.cdsReqs.ChangeCount>0);

end;

procedure TFRequisicion.dbgReqsCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
 if DM1.cdsReqs.FieldByName('FLAGVAR').AsString = '*' then
   if (not Highlight) then
   begin
     AFont.Style := [fsBold];
     ABrush.Color := clInfoBk;
   end;
end;

procedure TFRequisicion.Z2bbtnCanc2Click(Sender: TObject);
begin
 if (DM1.cdsReqs.Modified) or (DM1.cdsReqs.ChangeCount>0) then
    DM1.cdsReqs.CancelUpdates;

 btnDetalle;

end;

procedure TFRequisicion.Z2bbtnGrabaClick(Sender: TObject);
var
  sCIAID, sRQSID : String;
  sSQL           : String;
begin
  with DM1.cdsReqs do
  begin
    First;
    while not Eof do
    begin
      if trim(FieldByName('FLAGVAR').AsString) = '*' then
      begin
        sCIAID := FieldByName('CIAID').AsString;
        sRQSID := FieldByName('RQSID').AsString;
        Edit;
        FieldByName('RQSEST').AsString    := 'ATENDIDO';
        FieldByName('RQSFATE').AsDateTime := Date;
        FieldByName('FLAGVAR').Clear;
        Post;
        sSQL := 'UPDATE LOG309 SET RQSEST=''ATENDIDO'' WHERE CIAID='''+
                 sCIAID+''' AND RQSID='''+sRQSID+'''';
        DM1.ExecSQL( sSQL );
      end;
      Next;
    end;
  end;
  btnDetalle;

  if (DM1.cdsReqs.Modified) or (DM1.cdsReqs.ChangeCount>0) then
  begin
    DM1.cdsReqs.ApplyUpdates(0);
    DM1.cdsReqs.Close;
    DM1.cdsReqs.Open;
  end;
end;

procedure TFRequisicion.btnDetalle;
var
  bBtn : Boolean;
begin
  bBtn := (DM1.cdsReqs.Modified) or (DM1.cdsReqs.ChangeCount>0);
  Z2bbtnGraba.Enabled := bBtn;
  Z2bbtnCanc2.Enabled := bBtn;
end;

procedure TFRequisicion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   with DM1.cdsReqs do
   begin
     DisableControls;
     Close;
     DataRequest('SELECT * FROM LOG308');
     Open;
     EnableControls;
   end;
   Action := caHide;
end;

procedure TFRequisicion.dbgReqsCalcTitleAttributes(Sender: TObject;
  AFieldName: String; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
begin
   if AFieldName='RQSID' then
   begin
      AFont.Color:=clRed;
   end;
end;

procedure TFRequisicion.dbgReqsTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
   if AFieldName='RQSID' then
   begin
      pnlBusca.Visible:=True;
      isBusca.SetFocus;
   end;
end;

procedure TFRequisicion.isBuscaKeyPress(Sender: TObject; var Key: Char);
begin
   if (key=#13) or (key=#27) then pnlBusca.Visible:=False;
end;

end.
