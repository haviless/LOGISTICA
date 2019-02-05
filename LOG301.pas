Unit LOG301;
//Inicio Uso de Estándares : 01/08/2011
//Unidad                   : LOG301
//Formulario               : FToolSolCotizacion
//Fecha de Creación        : 19/07/2012
//Autor                    : Abelardo Sulca Palomino
//Objetivo                 : Tool bar de la Solicitudes de Cotización

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, StdCtrls, Buttons, ppEndUsr, ppProd, ppClass,
   ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppBands, ppCache;

Type
   TFToolSolCotizacion = Class(TForm)
      pnlAct: TPanel;
      btnReporteRequerimientos: TBitBtn;
      Label2: TLabel;
      ppdbSolCotizacion: TppDBPipeline;
      pprSolCotizacion: TppReport;
      ppdSolCotizacion: TppDesigner;
      ppHeaderBand1: TppHeaderBand;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      Procedure btnReporteRequerimientosClick(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FToolSolCotizacion: TFToolSolCotizacion;

Implementation
Uses LOGDM1, oaAD3000;
{$R *.dfm}

Procedure TFToolSolCotizacion.btnReporteRequerimientosClick(
   Sender: TObject);
Var
   xSQL, xsFiltro: String;
   xsFiltroTexto1, xsFiltroTexto2, xsFiltroTexto3, xsFiltroTexto4: String;
   xsFiltroTexto5, xsFiltroTexto6, xsFiltroTexto7, xsFiltroTexto8: String;
   xsFiltroUsuario: String;
   xnContador: integer;
Begin
   xsFiltroUsuario := '';
   xsFiltroTexto1 := ' ';
   xsFiltroTexto2 := ' ';
   xsFiltroTexto3 := ' ';
   xsFiltroTexto4 := ' ';
   xsFiltroTexto5 := ' ';
   xsFiltroTexto6 := ' ';
   xsFiltroTexto7 := ' ';
   xsFiltroTexto8 := ' ';
   xsFiltro := '';
   For xnContador := 0 To Mtx3000.FMant.lbFiltroReal.Count - 1 Do
   Begin
      If length(trim(xsFiltro)) = 0 Then
      Begin
         xsFiltro := Mtx3000.FMant.lbFiltroReal.items[xnContador];
      End
      Else
      Begin
         xsFiltro := xsFiltro + ' AND ' + Mtx3000.FMant.lbFiltroReal.items[xnContador];
      End;
      If xnContador = 0 Then
         xsFiltroTexto1 := Mtx3000.FMant.lbFiltro.items[xnContador]
      Else
         If xnContador = 1 Then
            xsFiltroTexto2 := Mtx3000.FMant.lbFiltro.items[xnContador]
         Else
            If xnContador = 2 Then
               xsFiltroTexto3 := Mtx3000.FMant.lbFiltro.items[xnContador]
            Else
               If xnContador = 3 Then
                  xsFiltroTexto4 := Mtx3000.FMant.lbFiltro.items[xnContador]
               Else
                  If xnContador = 4 Then
                     xsFiltroTexto5 := Mtx3000.FMant.lbFiltro.items[xnContador]
                  Else
                     If xnContador = 5 Then
                        xsFiltroTexto6 := Mtx3000.FMant.lbFiltro.items[xnContador]
                     Else
                        If xnContador = 6 Then
                           xsFiltroTexto7 := Mtx3000.FMant.lbFiltro.items[xnContador]
                        Else
                           If xnContador = 7 Then xsFiltroTexto8 := Mtx3000.FMant.lbFiltro.items[xnContador];
   End;
   If Length(Mtx3000.Filter) > 0 Then
   Begin
      xsFiltroUsuario := ' AND ' + Mtx3000.Filter;
   End;
   If length(trim(xsFiltro)) > 0 Then
   Begin
      xsFiltro := ' AND ' + xsFiltro;
   End;
   xSQL := ' Select LOG302.CIAID COMPANIA, '
      + '           LOG302.LOCID LOCALIDADID, '
      + '           TGE126.LOCDES LOCALIDADDES, '
      + '           LOG302.SCCID SOLCOTIZACION, '
      + '           LOG302.SCCEST ESTADO,'
      + '           LOG302.SCCFSOL FECHA, '
      + '           LOG302.TMONID MONEDAID, '
      + '           TGE103.TMONABR MONEDADES, '
      + '           LOG302.TSCID TIPOSOLICITUDID, '
      + '           TGE137.TSCDES TIPOSOLICITUDDES, '
      + '           LOG302.LGECID LUGARENTREGAID, '
      + '           TGE136.LGECDES LUGARENTREGADES, '
      + '           LOG302.SCCFENT FECHAENTREGA, '
      + '           LOG302.COMPID COMPRADORID, '
      + '           TGE135.COMPDES COMPRADORDES, '
      + '           LOG302.SCCOBS OBSERVACION, '
      + '           LOG302.SCCUSER USUARIO, '
      + '           LOG302.NUMCC NUMCCOMPARATIVO, '
      +             QuotedStr(DMLOG.wUsuario) + ' USUARIO_IMPRIME, '
      +             QuotedStr(xsFiltroTexto1) + ' FILTRO1, '
      +             QuotedStr(xsFiltroTexto2) + ' FILTRO2, '
      +             QuotedStr(xsFiltroTexto3) + ' FILTRO3, '
      +             QuotedStr(xsFiltroTexto4) + ' FILTRO4, '
      +             QuotedStr(xsFiltroTexto5) + ' FILTRO5, '
      +             QuotedStr(xsFiltroTexto6) + ' FILTRO6, '
      +             QuotedStr(xsFiltroTexto7) + ' FILTRO7, '
      +             QuotedStr(xsFiltroTexto8) + ' FILTRO8 '
      + '      from LOG302,TGE126,TGE103,TGE137,TGE136, TGE135 '
      + '     where LOG302.CIAID = TGE126.CIAID  '
      + '       and LOG302.LOCID = TGE126.LOCID '
      + '       and LOG302.TMONID = TGE103.TMONID  '
      + '       and LOG302.TSCID = TGE137.TSCID '
      + '       and LOG302.LGECID = TGE136.LGECID  '
      + '       and LOG302.COMPID = TGE135.COMPCID  '
      +xsFiltroUsuario + xsFiltro
      + '     order by LOG302.CIAID , LOG302.SCCID  ';

   DMLOG.cdsReporte.Close;
   DMLOG.cdsReporte.DataRequest(xSQL);
   DMLOG.cdsReporte.Open;

   If DMLOG.cdsReporte.RecordCount = 0 Then
   Begin
      showmessage('No se recuperó ningún registro');
      exit;
   End;
   ppdbSolCotizacion.DataSource := DMLOG.dsReporte;
   pprSolCotizacion.DataPipeline := ppdbSolCotizacion;

   pprSolCotizacion.Template.FileName := wRutaRpt + '\RptSolCotizacion.rtm';
   pprSolCotizacion.Template.LoadFromFile;
   pprSolCotizacion.Print;

End;

End.

