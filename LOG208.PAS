unit LOG208;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Wwdbigrd, Grids, Wwdbgrid, ExtCtrls, db, wwdblook,
  Wwdbdlg, Mask, wwdbedit, ppProd, ppClass, ppReport, ppComm, ppRelatv,
  ppCache, ppDB, ppDBPipe, ppModule, daDatMod, ppBands, ppPrnabl, ppCtrls, ppViewr,
  ppArchiv;

type
  TFOCompra = class(TForm)
    pnlReqs: TPanel;
    dbgOrdComp: TwwDBGrid;
    Z2btnNuevo: TwwIButton;
    lblTitle: TLabel;
    bvl2: TBevel;
    pnlDetalleA: TPanel;
    bvlDetalle: TBevel;
    Z2bbtnRegOk: TBitBtn;
    Z2bbtnRegCanc: TBitBtn;
    stxTitulo2: TStaticText;
    ppdbOC: TppDBPipeline;
    pprOCP: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    pdbtSRES: TppDBText;
    pdbtDIR: TppDBText;
    pdbtCOD: TppDBText;
    pdbtRUC: TppDBText;
    pdbtFAX: TppDBText;
    pdbtTLF: TppDBText;
    pdbtRQS: TppDBText;
    pdbtFENT: TppDBText;
    pdbtLENT: TppDBText;
    pdbtMON: TppDBText;
    pdbtNUM: TppDBText;
    pdbtFORD: TppDBText;
    pdbtCONDPAG: TppDBText;
    pdbtCODART: TppDBText;
    ppdbtDSCART: TppDBText;
    pdbUNMED: TppDBText;
    pdbtCANT: TppDBText;
    pdbtPUNIT: TppDBText;
    pdbtDSCTO: TppDBText;
    pdbtIMPORT: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    pdbtTOTAL: TppDBText;
    ppdbtIGV: TppDBText;
    pdbtIMPTOTAL: TppDBText;
    Z2bbtnPrint: TBitBtn;
    Label1: TLabel;
    pprOCPE: TppReport;
    Z2bbtnEmail: TBitBtn;
    ppHeaderBand2: TppHeaderBand;
    ppShape5: TppShape;
    ppShape3: TppShape;
    ppShape2: TppShape;
    ppShape1: TppShape;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppShape4: TppShape;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLine8: TppLine;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppSummaryBand2: TppSummaryBand;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppShape6: TppShape;
    ppArchiveReader1: TppArchiveReader;
    procedure Z2btnNuevoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgOrdCompKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgOrdCompDblClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Z2bbtnPrintClick(Sender: TObject);
    procedure pprOCPBeforePrint(Sender: TObject);
    procedure pprOCPAfterPrint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Z2bbtnEmailClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ppReportOC ;
  end;

var
  FOCompra: TFOCompra;

implementation

uses LOGDM1, LOG209, LOG210, oaAD3000;

{$R *.DFM}

procedure TFOCompra.Z2btnNuevoClick(Sender: TObject);
begin
 if DM1.cdsOrdComp.State in [dsInsert,dsEdit] then
    DM1.cdsOrdComp.Cancel;
 ///DM1.cdsOrdComp.Insert;

 with DM1, DM1.cdsDOrdComp do
 begin
   Close;
   DataRequest('SELECT * FROM LOG305');
   MasterSource := dsOrdComp;
   MasterFields := 'CIAID;ODCID';
   IndexFieldNames := 'CIAID;ODCID';
   Open;
 end;

 FGenOrdCom.ShowModal;
end;

procedure TFOCompra.FormCreate(Sender: TObject);
begin
  Left := 0;
  Top  := 0;
  FormResize(nil);

  with DM1 do
  begin
     with cdsOrdComp do
     begin
        Close;
        DataRequest('SELECT * FROM LOG304');
        Open;
     end;
     // al pulsar doble click en el grid se toma el detalle y se genera ...
  end;
end;

procedure TFOCompra.dbgOrdCompKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=$4D) and (ssCtrl in Shift) then
  begin
    dbgOrdCompDblClick(nil);
  end;

{if (Key=VK_DELETE) and (ssCtrl in Shift)  then
 begin
    DM1.cdsOrdComp.Delete;
    FRegReqs.ShowModal;
 end;}
end;

procedure TFOCompra.dbgOrdCompDblClick(Sender: TObject);
var
 sCIA, sODC, sSQL : String;

begin

 sCIA := DM1.cdsOrdComp.FieldByName('CIAID').AsString;
 sODC := DM1.cdsOrdComp.FieldByName('ODCID').AsString;

 sSQL := 'SELECT * FROM LOG305 WHERE CIAID='''+sCIA+'''AND ODCID='''+sODC+'''';

 with DM1, DM1.cdsDOrdComp do
 begin
   Close;
   DataRequest(sSQL);
   MasterSource    := dsOrdComp;
   MasterFields    := 'CIAID;ODCID';
   IndexFieldNames := 'CIAID;ODCID';
   Open;
 end;

 with FRegOrdC do
 begin
   dblcCIA.Enabled         := False;
   dedNProforma.Enabled    := False;
   Z2dbgDReqsIButton.Enabled := False;

   DM1.cdsOrdComp.Edit;
   ShowModal;
 end;
end;

procedure TFOCompra.FormResize(Sender: TObject);
begin
  with ClientRect do
  begin
    dbgOrdComp.Left   := Left+10;
    dbgOrdComp.Top    := Top+lblTitle.Top+lblTitle.Height+20;
    dbgOrdComp.Width  := (dbgOrdComp.Left+Right)-35;
    dbgOrdComp.Height := Bottom-75;
    Z2bbtnPrint.Left    := Width - (Z2bbtnPrint.Width + 20);
    Z2bbtnEmail.Left    := Width - (Z2bbtnPrint.Width+Z2bbtnEmail.Width+20);
  end;
end;

procedure TFOCompra.Z2bbtnPrintClick(Sender: TObject);
begin
 ppReportOC;
 ppdbOC.DataSource := DM1.dsSQL;
 pprOCP.Print;
end;

procedure TFOCompra.ppReportOC;
var
  sSQL ,
  sCIA : String;
begin
 with DM1.cdsSQL do
 begin
   sCIA  := DM1.cdsOrdComp.FieldByName('ODCID').AsString;
   sSQL  := ' SELECT                                   '+
            '   A.*, B.*, C.*, D.*, E.*, F.*, G.*, H.*,'+
            '   I.*                                    '+
            ' FROM                                     '+
            '   LOG304 A,                     '+
            '   LOG305 B,                     '+
            '   TGE201 C,                     '+
            '   TGE136 D,                     '+
            '   TGE103 E,                     '+
            '   TGE130 F,                     '+
            '   TGE101 G,                     '+
            '   TGE112 H,                     '+
            '   TGE205 I                      '+
            ' WHERE                                    '+
            '     A.CIAID=B.CIAID                      '+
            ' AND B.ODCID=A.ODCID                      '+
            ' AND C.PROV=A.PROV                        '+
            ' AND D.LGECID=A.LGECID                    '+
            ' AND E.TMONID=A.TMONID                    '+
            ' AND F.UNMID=B.UNMID                      '+
            ' AND G.CIAID=A.CIAID                      '+
            ' AND H.FPAGOID=A.FPAGOID                  '+
            ' AND I.ARTID=B.ARTID                      '+
            ' AND A.ODCID='''+sCIA+'''';

   DisableControls;
   Close;
   DataRequest(sSQL);
   Open;
   EnableControls;
 end;
end;

procedure TFOCompra.pprOCPBeforePrint(Sender: TObject);
begin
{ pprOCP.PreviewForm.WindowState := wsMaximized;
 TppViewer(pprOCP.PreviewForm.Viewer).ZoomSetting := zsPageWidth;}
 TppReport(Sender).PreviewForm.WindowState := wsMaximized;
 TppViewer(TppReport(Sender).PreviewForm.Viewer).ZoomSetting := zsPageWidth;
end;

procedure TFOCompra.pprOCPAfterPrint(Sender: TObject);
begin
  if DM1.cdsOrdComp.FieldByName('ODCFATE').IsNull then
  begin
   DM1.cdsOrdComp.Edit;
   DM1.cdsOrdComp.FieldByName('ODCFATE').AsDateTime := Date;
	 DM1.cdsOrdComp.Post;
	 //dm1.ControlTran;
	 DM1.ControlTran( 9, dm1.cdsOrdComp, 'ORDCOMP');
   //DM1.cdsOrdComp.ApplyUpdates(0);
  end;
end;

procedure TFOCompra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with DM1 do
  begin

  end;
end;

procedure TFOCompra.Z2bbtnEmailClick(Sender: TObject);
begin
 ppReportOC;
 ppdbOC.DataSource := DM1.dsSQL;
 pprOCPE.Print;
end;

end.
