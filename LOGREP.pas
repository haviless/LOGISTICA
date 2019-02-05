unit LOGREP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppPrnabl, ppClass, ppCtrls, ppBands, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, ppViewr, StdCtrls, Mask, ExtCtrls, Buttons, Db, Wwdatsrc,
  DBTables, Wwtable, ppDB, ppDBPipe, ppEndUsr, ppDBBDE, ShellApi, ppTypes;

type
  TFPreview = class(TForm)
    pnlPreviewBar: TPanel;
    spbPreviewPrint: TSpeedButton;
    Bevel1: TBevel;
    spbAutoSearch: TSpeedButton;
    pnlStandardButtons: TPanel;
    spbPreviewWhole: TSpeedButton;
    spbPreviewFirst: TSpeedButton;
    spbPreviewPrior: TSpeedButton;
    spbPreviewNext: TSpeedButton;
    spbPreviewLast: TSpeedButton;
    spbPreviewWidth: TSpeedButton;
    spbPreview100Percent: TSpeedButton;
    spbPreviewClose: TSpeedButton;
    mskPreviewPage: TMaskEdit;
    mskPreviewPercentage: TMaskEdit;
    ppViewer1: TppViewer;
    sbEMail: TSpeedButton;
    procedure spbAutoSearchClick(Sender: TObject);
    procedure spbPreviewWholeClick(Sender: TObject);
    procedure spbPreviewPrintClick(Sender: TObject);
    procedure spbPreviewWidthClick(Sender: TObject);
    procedure spbPreview100PercentClick(Sender: TObject);
    procedure spbPreviewCloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure spbPreviewFirstClick(Sender: TObject);
    procedure spbPreviewLastClick(Sender: TObject);
    procedure spbPreviewPriorClick(Sender: TObject);
    procedure spbPreviewNextClick(Sender: TObject);
    procedure mskPreviewPageKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mskPreviewPageKeyPress(Sender: TObject; var Key: Char);
    procedure mskPreviewPercentageKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mskPreviewPercentageKeyPress(Sender: TObject; var Key: Char);
    procedure sbEMailClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPreview: TFPreview;

implementation

uses LOGDM1, LOG205;

//uses SOLFiltrosDM, SOLFiltros01;

{$R *.DFM}

procedure TFPreview.spbAutoSearchClick(Sender: TObject);
begin
  ppViewer1.DisplayAutoSearchDialog;
end;

procedure TFPreview.spbPreviewWholeClick(Sender: TObject);
begin
  ppViewer1.ZoomSetting := zsWholePage;

  mskPreviewPercentage.Text := IntToStr(ppViewer1.CalculatedZoom);
end;

procedure TFPreview.spbPreviewPrintClick(Sender: TObject);
begin
  ppViewer1.Print;
end;

procedure TFPreview.spbPreviewWidthClick(Sender: TObject);
begin
  ppViewer1.ZoomSetting := zsPageWidth;

  mskPreviewPercentage.Text := IntToStr(ppViewer1.CalculatedZoom);
end;

procedure TFPreview.spbPreview100PercentClick(Sender: TObject);
begin
  ppViewer1.ZoomSetting := zs100Percent;

  mskPreviewPercentage.Text := IntToStr(ppViewer1.CalculatedZoom);
end;

procedure TFPreview.spbPreviewCloseClick(Sender: TObject);
begin
   Close;
end;

procedure TFPreview.FormActivate(Sender: TObject);
begin
  ppViewer1.Report := FSCxP.pprSolicitud;
  ppViewer1.DisplayAutoSearchDialog;
end;

procedure TFPreview.spbPreviewFirstClick(Sender: TObject);
begin
  ppViewer1.FirstPage;
end;

procedure TFPreview.spbPreviewLastClick(Sender: TObject);
begin
  ppViewer1.LastPage;
end;

procedure TFPreview.spbPreviewPriorClick(Sender: TObject);
begin
  ppViewer1.PriorPage;
end;

procedure TFPreview.spbPreviewNextClick(Sender: TObject);
begin
  ppViewer1.NextPage;
end;

procedure TFPreview.mskPreviewPageKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  lScrollBar: TControlScrollBar;
begin

  if (ssCtrl in Shift) then
    begin

      case Key of
       VK_PRIOR: ppViewer1.PriorPage;
       VK_NEXT:  ppViewer1.NextPage;
       VK_HOME:  ppViewer1.FirstPage;
       VK_END:   ppViewer1.LastPage;
      end;

    end
  else
    begin

      case Key of
       VK_PRIOR, VK_UP:
         begin
           lScrollBar := ppViewer1.ScrollBox.VertScrollBar;
           lScrollBar.Position := lScrollBar.Position - ppViewer1.ScrollBox.Height;
         end;

       VK_NEXT, VK_DOWN:
         begin
           lScrollBar := ppViewer1.ScrollBox.VertScrollBar;
           lScrollBar.Position := lScrollBar.Position + ppViewer1.ScrollBox.Height;
         end;

       VK_LEFT:
         begin
           lScrollBar := ppViewer1.ScrollBox.HorzScrollBar;
           lScrollBar.Position := lScrollBar.Position - ppViewer1.ScrollBox.Width;
         end;

       VK_RIGHT:
         begin
           lScrollBar := ppViewer1.ScrollBox.HorzScrollBar;
           lScrollBar.Position := lScrollBar.Position + ppViewer1.ScrollBox.Width;
         end;

      end;

    end;

end;

procedure TFPreview.mskPreviewPageKeyPress(Sender: TObject; var Key: Char);
var
  liPage: Longint;
begin

  if (Key = #13) then
    begin
      liPage := StrToInt(mskPreviewPage.Text);

      ppViewer1.GotoPage(liPage);
    end; {if, carriage return pressed}

end;

procedure TFPreview.mskPreviewPercentageKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  lScrollBar: TControlScrollBar;
begin

  if (ssCtrl in Shift) then
    begin

      case Key of
       VK_PRIOR: ppViewer1.PriorPage;
       VK_NEXT:  ppViewer1.NextPage;
       VK_HOME:  ppViewer1.FirstPage;
       VK_END:   ppViewer1.LastPage;
      end;

    end
  else
    begin

      case Key of
       VK_PRIOR, VK_UP:
         begin
           lScrollBar := ppViewer1.ScrollBox.VertScrollBar;
           lScrollBar.Position := lScrollBar.Position - ppViewer1.ScrollBox.Height;
         end;

       VK_NEXT, VK_DOWN:
         begin
           lScrollBar := ppViewer1.ScrollBox.VertScrollBar;
           lScrollBar.Position := lScrollBar.Position + ppViewer1.ScrollBox.Height;
         end;

       VK_LEFT:
         begin
           lScrollBar := ppViewer1.ScrollBox.HorzScrollBar;
           lScrollBar.Position := lScrollBar.Position - ppViewer1.ScrollBox.Width;
         end;

       VK_RIGHT:
         begin
           lScrollBar := ppViewer1.ScrollBox.HorzScrollBar;
           lScrollBar.Position := lScrollBar.Position + ppViewer1.ScrollBox.Width;
         end;

      end;

    end;

end;

procedure TFPreview.mskPreviewPercentageKeyPress(Sender: TObject;
  var Key: Char);
var
  liPercentage: Integer;
begin
  if (Key = #13) then
    begin
      liPercentage := StrToIntDef(mskPreviewPercentage.Text, 100);

      ppViewer1.ZoomPercentage := liPercentage;

      spbPreviewWhole.Down := False;
      spbPreviewWidth.Down := False;
      spbPreview100Percent.Down := False;

      mskPreviewPercentage.Text := IntToStr(ppViewer1.CalculatedZoom);
    end; {if, carriage return pressed}
end;

procedure TFPreview.sbEMailClick(Sender: TObject);
var
   vemail,ssql,strmsg, xxName: String;
begin

   xxName:='C:\SOL\'+DMLOG.cdsSolCot.fieldbyname('SCCID').AsString+DMLOG.cdsSCxProv.fieldbyname('PROV').AsString+'_0001.HTM';

   ssql := 'PROV=' + QuotedStr(DMLOG.cdsSCxProv.fieldbyname('PROV').Value);
   vemail := DMLOG.displaydescrip('prvProv','TGE201','*',ssql,'PROVEMAI');
   strMsg := 'mailto:'+ vemail +'?Subject='+'Solicitud de Cotización No: '
           + DMLOG.cdsSolCot.fieldbyname('SCCID').AsString+'&body=Se adjunta '+xxName
           + '&Attach=\'+xxName+'\';
   Shellexecute(Handle, 'open', pChar(strMsg),'','',SW_SHOW);
end;

end.
