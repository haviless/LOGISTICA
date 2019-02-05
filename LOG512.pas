unit LOG512;
// Inicio Uso Estándares:   01/08/2011
// Unidad               :   LOG512
// Formulario           :   FToolProvRubro
// Fecha de Creación    :   13/04/2012
// Autor                :   Abelardo Sulca Palomino
// Objetivo             :   tool del mantenimiento de proveedores donde se
//                          invoca al reporte de proveedores por Rubro
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppDB, ppDBPipe, ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppCache, ppviewr,
  ppComm, ppRelatv, ppProd, ppReport, StdCtrls, wwdblook, Buttons, ExtCtrls, msgdlgs, ppTypes,
  ppEndUsr;

type
  TFToolProvRubro = class(TForm)
    pnl: TPanel;
    btnRptProvPorRubro: TBitBtn;
    Label1: TLabel;
    ppdbProvPorRubro: TppDBPipeline;
    pprProvPorRubro: TppReport;
    ppdProvPorRubro: TppDesigner;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    procedure btnRptProvPorRubroClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FToolProvRubro: TFToolProvRubro;
  xActCia : String;

implementation

uses LOGDM1, oaAD5000;

{$R *.DFM}


Procedure TFToolProvRubro.btnRptProvPorRubroClick(Sender: TObject);
Var
   xsSQL, xsFiltro : String;
   xsFiltroTexto1, xsFiltroTexto2, xsFiltroTexto3, xsFiltroTexto4 :String;
   xsFiltroTexto5, xsFiltroTexto6, xsFiltroTexto7, xsFiltroTexto8 :String;
   xnContador : integer;
   xbExisteOr :Boolean;
   xsString :String;
Begin
   xsFiltroTexto1 := ' ';
   xsFiltroTexto2 := ' ';
   xsFiltroTexto3 := ' ';
   xsFiltroTexto4 := ' ';
   xsFiltroTexto5 := ' ';
   xsFiltroTexto6 := ' ';
   xsFiltroTexto7 := ' ';
   xsFiltroTexto8 := ' ';
   xsFiltro:='';
   xbExisteOr := False;
   xsString := '';
   For xnContador:=0 To mtx5000.FMant.lbFiltroReal.Count-1 Do
   Begin
       xsString  := Uppercase( mtx5000.FMant.lbFiltroReal.items[xnContador]);
       If Pos('OR',Trim(xsString))=1 Then //si en el filtro hay "or" entonces no agregarmos "And"
       Begin
          xbExisteOr := True;
       End;


       If length(trim(xsFiltro))= 0 Then
       Begin
          xsFiltro := mtx5000.FMant.lbFiltroReal.items[xnContador];
       End
       Else
       Begin
          If xbExisteOr = False Then
          Begin
             xsFiltro:=xsFiltro+' and '+mtx5000.FMant.lbFiltroReal.items[xnContador];
          End
          Else
          Begin
             xsFiltro:=xsFiltro+' '+mtx5000.FMant.lbFiltroReal.items[xnContador];
          End;
       End;
       If xnContador = 0 Then xsFiltroTexto1 :=  mtx5000.FMant.lbFiltro.items[xnContador]
       Else If xnContador = 1 Then xsFiltroTexto2 :=  mtx5000.FMant.lbFiltro.items[xnContador]
       Else If xnContador = 2 Then xsFiltroTexto3 :=  mtx5000.FMant.lbFiltro.items[xnContador]
       Else If xnContador = 3 Then xsFiltroTexto4 :=  mtx5000.FMant.lbFiltro.items[xnContador]
       Else If xnContador = 4 Then xsFiltroTexto5 :=  mtx5000.FMant.lbFiltro.items[xnContador]
       Else If xnContador = 5 Then xsFiltroTexto6 :=  mtx5000.FMant.lbFiltro.items[xnContador]
       Else If xnContador = 6 Then xsFiltroTexto7 :=  mtx5000.FMant.lbFiltro.items[xnContador]
       Else If xnContador = 7 Then xsFiltroTexto8 :=  mtx5000.FMant.lbFiltro.items[xnContador];



   End;
   If length(trim(xsFiltro))> 0 Then
   Begin
      xsFiltro := ' AND ' +xsFiltro;
   End;

   xsSql := ' SELECT TGE201.CLAUXID CLAUXID, '+//codigo auxiliar
                 ' TGE201.PROV PROV, '+// --codigo proveedor
                 ' TGE201.PROVDES PROVDES, '+// --proveedor
                 ' TGE201.TIPPERID TIPPERID, '+//--tipo de persona
                 ' (SELECT TGE109.TIPPERDES FROM TGE109 WHERE TGE201.TIPPERID = TGE109.TIPPERID ) TIPOPERSONA, '  +
                 ' TGE201.PROVRUC PROVRUC,  '+//-- ruc
                 ' TGE201.ACTIVO ACTIVO,  '+//--Telefono
                 ' TGE201.PROVTELF TELEFONO,  '+//--Telefono
                 ' TGE201.PROVFAX FAX,  '+//--Telefono
                 ' TGE201.PROVEMAI EMAIL,  '+//--Telefono
                 ' TGE201.PROVDIR PROVDIR, '+// --direccion
                 ' TGE201.PROVRETIGV PROVRETIGV,  '+// --se le debe retener el IGV
                 ' TGE201.DPTOID DPTOID, '+// --departamento
                 ' TGE147.UBIGEODPTO UBIGEODPTO , '+// --departamento
                 ' TGE201.CIUDID CIUDID, '+// --provincia
                 ' TGE147.UBIGEOPROV UBIGEOPROV ,  '+//--provincia
                 ' TGE201.PROVCZIP PROVCZIP, '+// --distrito
                 ' TGE147.UBIGEODIST UBIGEODIST , '+// --distrito
                 ' LOG201.TIPPROVID TIPPROVID,  '+//--codigo del rubro
                 ' TGE134.TIPPROVDES TIPPROVDES ,'+ // --descripcion del rubro
                 ' CONTACTO.NOMBRES CONT_NOMBRES, '  +
                 ' CONTACTO.CARGODES CONT_CARGO, ' +
                 ' CONTACTO.TELEFONO CONT_TELEFONO, '  +
                 ' CONTACTO.CORREO CONT_CORREO, '  +
                 QuotedStr(DMLOG.wUsuario)  + ' USUARIO_IMPRIME, '+
                 QuotedStr(xsFiltroTexto1 ) + ' FILTRO1, ' +
                 QuotedStr(xsFiltroTexto2 ) + ' FILTRO2, ' +
                 QuotedStr(xsFiltroTexto3 ) + ' FILTRO3, ' +
                 QuotedStr(xsFiltroTexto4 ) + ' FILTRO4, ' +
                 QuotedStr(xsFiltroTexto5 ) + ' FILTRO5, ' +
                 QuotedStr(xsFiltroTexto6 ) + ' FILTRO6, ' +
                 QuotedStr(xsFiltroTexto7 ) + ' FILTRO7, ' +
                 QuotedStr(xsFiltroTexto8 ) + ' FILTRO8 ' +
                 ' FROM TGE201,LOG201 ,TGE147,TGE134, (SELECT LOG204.CLAUXID, ' +
                                                            ' LOG204.PROV,LOG204.NOMBRES,LOG204.TIPO , '+
                                                            ' LOG204.CARGOID, '+
                                                            ' (SELECT TGE193.CARGODES FROM TGE193 WHERE LOG204.CARGOID = TGE193.CARGOID ) CARGODES, '+
                                                            ' LOG204.TELEFONO,LOG204.CORREO ' +
                                                            ' FROM LOG204 '+
                                                            ' WHERE LOG204.TIPO = '+QuotedStr('CONT')+') CONTACTO'+
                 ' WHERE TGE201.CLAUXID = LOG201.CLAUXID(+)  '+
                 ' AND TGE201.PROV = LOG201.PROV(+) '+
                 ' AND TGE201.DPTOID||TGE201.CIUDID||TGE201.PROVCZIP = TGE147.UBIGEOID(+)' +
                 ' AND LOG201.TIPPROVID = TGE134.TIPPROVID(+)'+
                 ' AND TGE201.CLAUXID = CONTACTO.CLAUXID(+) '     +
                 ' AND TGE201.PROV = CONTACTO.PROV(+) '+ xsFiltro;
   xsSql := xsSql + ' ORDER BY LOG201.TIPPROVID,TGE201.PROV ';
	 DMLOG.cdsReporte.Close;
	 DMLOG.cdsReporte.DataRequest(xsSQL);
	 DMLOG.cdsReporte.Open;

   //DMLOG.cdsQry.Close;
   //DMLOG.cdsQry.DataRequest(xSQL);
   //DMLOG.cdsQry.Open;
   If DMLOG.cdsReporte.RecordCount = 0 Then
   Begin
      showmessage('No se recuperó ningún registro');
      exit;
   End;
   ppdbProvPorRubro.DataSource := DMLOG.dsReporte;
   pprProvPorRubro.DataPipeline :=  ppdbProvPorRubro;

   pprProvPorRubro.Template.FileName :=  wRutaRpt + '\ProvPorRubro.rtm';
   pprProvPorRubro.Template.LoadFromFile;
   //para mostrar el diseñador del reporte
   ppdProvPorRubro.Report := pprProvPorRubro ;
   ppdProvPorRubro.ShowModal() ;
   //pprProvPorRubro.Print;


end;

end.
