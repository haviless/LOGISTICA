unit LOG214;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, DBCGrids, StdCtrls, Mask, DBCtrls,
  Buttons, db, ComCtrls, wwriched, wwdblook, ppDB, ppBands, ppClass,
  ppProd, ppReport, ppComm, ppRelatv, ppCache, ppDBPipe, ppStrtch,
  ppSubRpt, ppCtrls, ppPrnabl, ppMemo, ppVar, ppCTMain, ppRegion, ppEndUsr,
  ppViewr, ppTypes;

type
  TFEvalProf = class(TForm)
    pnlSolCot: TPanel;
    dbgSolCot: TwwDBGrid;
    DBCtrlGrid1: TDBCtrlGrid;
    pnlTP: TPanel;
    dbgResultado: TwwDBGrid;
    lblArt: TLabel;
    dbeArti: TDBEdit;
    dbeProv: TDBEdit;
    lblProv: TLabel;
    dbtCond1: TDBText;
    dbeCond1: TDBEdit;
    dbeCond3: TDBEdit;
    dbtCond3: TDBText;
    dbtCond5: TDBText;
    dbeCond5: TDBEdit;
    dbeCond2: TDBEdit;
    dbeCond4: TDBEdit;
    dbtCond2: TDBText;
    dbtCond4: TDBText;
    dbtCond6: TDBText;
    dbtCond7: TDBText;
    dbtCond8: TDBText;
    dbtCond9: TDBText;
    lblTotPun: TLabel;
    dbeTotPun: TDBEdit;
    dbeCond10: TDBEdit;
    dbeCond9: TDBEdit;
    dbeCond8: TDBEdit;
    dbeCond7: TDBEdit;
    dbeCond6: TDBEdit;
    stxTitulo2: TStaticText;
    Bevel2: TBevel;
    Z2bbtnOkEval: TBitBtn;
    Z2bbtnCancelEval: TBitBtn;
    Z2bbtnOkSuma: TBitBtn;
    Z2bbtnOkPrint: TBitBtn;
    stxTitulo3: TStaticText;
    dbtCond10: TDBText;
    ppDBPReport1: TppDBPipeline;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppDBTCia: TppDBText;
    ppDBTCiadir: TppDBText;
    ppLblciatlf: TppLabel;
    ppDBTCiatlf: TppDBText;
    ppLblciafax: TppLabel;
    ppDBTciafax: TppDBText;
    ppLblTit: TppLabel;
    ppLblSCCID: TppLabel;
    ppDBTSccid: TppDBText;
    ppLn1: TppLine;
    ppLblArt: TppLabel;
    ppDBTArt: TppDBText;
    ppLblProv: TppLabel;
    ppDBTProv: TppDBText;
    ppDBTRef1: TppDBText;
    ppDBTRef2: TppDBText;
    ppDBTRef3: TppDBText;
    ppDBTRef4: TppDBText;
    ppDBTRef5: TppDBText;
    ppDBTRef6: TppDBText;
    ppDBTRef7: TppDBText;
    ppDBTRef8: TppDBText;
    ppDBTRef9: TppDBText;
    ppDBTRef10: TppDBText;
    ppDBTDat1: TppDBText;
    ppDBTDat2: TppDBText;
    ppDBTDat3: TppDBText;
    ppDBTDat4: TppDBText;
    ppDBTDat5: TppDBText;
    ppDBTDat6: TppDBText;
    ppDBTDat7: TppDBText;
    ppDBTDat8: TppDBText;
    ppDBTDat9: TppDBText;
    ppDBTDat10: TppDBText;
    ppLblPTO: TppLabel;
    ppDBTPto: TppDBText;
    ppDBPReport2: TppDBPipeline;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppColumnHeaderBand1: TppColumnHeaderBand;
    ppColumnFooterBand1: TppColumnFooterBand;
    ppReport2: TppReport;
    Z2bbtnOkPrint1: TBitBtn;
    ppReport3: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLblTotEval: TppLabel;
    ppDBTTESccid: TppDBText;
    ppDBTTECia: TppDBText;
    ppDBTTECiaDes: TppDBText;
    ppLblTECiaTlf: TppLabel;
    ppDBTTECiaTlf: TppDBText;
    ppLblTECiaFax: TppLabel;
    ppDBTTECiaFax: TppDBText;
    ppLblTESCCId: TppLabel;
    ppLnTE1: TppLine;
    ppLblTEProf: TppLabel;
    ppLblTEProv: TppLabel;
    ppLblTETotal: TppLabel;
    ppLblTEObs: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBTTEProf: TppDBText;
    ppDBTTEProv: TppDBText;
    ppDBTTETot: TppDBText;
    ppDBTTEEval: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppHeaderBand3: TppHeaderBand;
    ppDBTCiaR3: TppDBText;
    ppLblTitR3: TppLabel;
    ppLblSccidR3: TppLabel;
    ppDBTSccidR3: TppDBText;
    ppLn1R3: TppLine;
    ppSystemVariable3: TppSystemVariable;
    ppLabel4: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppLabel1: TppLabel;
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
    ppLabel2: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLine2: TppLine;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppLine1: TppLine;
    ppDBText11: TppDBText;
    ppLabel3: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppLblTit2: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLn2: TppLine;
    ppDetailBand5: TppDetailBand;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppFooterBand2: TppFooterBand;
    pnlVisar: TPanel;
    lblMotivos: TLabel;
    dbrgVisado: TDBRadioGroup;
    stxTitulo1: TStaticText;
    dblcMotivos: TwwDBLookupCombo;
    dbreMotivos: TwwDBRichEdit;
    Z2bbtnOkResul: TBitBtn;
    Z2bbtnCancelResul: TBitBtn;
    edtDatosProf: TEdit;
    procedure dbgSolCotDblClick(Sender: TObject);
    procedure Z2bbtnCancelEvalClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbeCond6Exit(Sender: TObject);
    procedure dblcMotivosChange(Sender: TObject);
    procedure dbrgVisadoChange(Sender: TObject);
    procedure Z2bbtnOkEvalClick(Sender: TObject);
    procedure Z2bbtnOkResulClick(Sender: TObject);
    procedure Z2bbtnCancelResulClick(Sender: TObject);
    procedure Z2bbtnOkSumaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Z2bbtnOkPrintClick(Sender: TObject);
    procedure ppReport1BeforePrint(Sender: TObject);
    procedure Z2bbtnOkPrint1Click(Sender: TObject);
    procedure ppReport3BeforePrint(Sender: TObject);
    procedure ppReport2BeforePrint(Sender: TObject);
    procedure ppReport2PreviewFormCreate(Sender: TObject);
    procedure ppReport3PreviewFormCreate(Sender: TObject);
    procedure ppReport1PreviewFormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    vsolcot : string;
    vCol : integer;
    xSqlAsignado : String;
    xActivo : bool;
    procedure Sumatoria;
  public
    { Public declarations }
  end;

var
  FEvalProf: TFEvalProf;

implementation

uses LOGDM1; //, oaAD3000;

{$R *.DFM}

procedure TFEvalProf.FormCreate(Sender: TObject);
var
	sSQL : String;
begin
  xSqlAsignado := '';
  if (SRV_D = 'DB2NT') or
		 (SRV_D = 'DB2400') then
  begin
    sSQL:=     'SELECT LOG312.PROV, LOG312.PROFID, TGE201.PROVDES, 0 AS TOTAL, ';
    sSQL:=sSQL+'CASE WHEN LOG312.PROFEVAL = ''P'' THEN ''Pendiente por Evaluar'' END EVALU0, ';
    sSQL:=sSQL+'CASE WHEN LOG312.PROFEVAL = ''A'' THEN ''Evaluado y Aceptado''   END EVALU1, ';
    sSQL:=sSQL+'CASE WHEN LOG312.PROFEVAL = ''D'' THEN ''Evaluado y Descartado'' END EVALU2, ';
    sSQL:=sSQL+''''' AS EVALU, ';
    sSQL:=sSQL+'LOG312.SCCID ';
    sSQL:=sSQL+'FROM LOG312,TGE201 ';
    sSQL:=sSQL+'WHERE LOG312.SCCID=''00001'' ';
    sSQL:=sSQL+'AND LOG312.PROV=TGE201.PROV ';
  end
  else
	if SRV_D = 'ORACLE' then
  begin
    sSQL:=     'SELECT LOG312.PROV, LOG312.PROFID,TGE201.PROVDES, 0 AS TOTAL, ';
    sSQL:=sSQL+'DECODE(LOG312.PROFEVAL, ''P'', ''Pendiente por Evaluar'') AS EVALU0, ';
    sSQL:=sSQL+'DECODE(LOG312.PROFEVAL, ''A'', ''Evaluado y Aceptado'') AS EVALU1, ';
    sSQL:=sSQL+'DECODE(LOG312.PROFEVAL, ''D'', ''Evaluado y Descartado'') AS EVALU2, ';
    sSQL:=sSQL+''''' AS EVALU, ';
    sSQL:=sSQL+'LOG312.SCCID ';
    sSQL:=sSQL+'FROM LOG312,TGE201 ';
    sSQL:=sSQL+'WHERE LOG312.SCCID=''00001'' ';
    sSQL:=sSQL+'AND LOG312.PROV=TGE201.PROV ';
  end;
  dm1.cdsTotEval.Close;
  dm1.cdsTotEval.DataRequest(sSQL);
  dm1.cdsTotEval.Open;

  if (SRV_D = 'DB2NT') or
		 (SRV_D = 'DB2400') then
  begin
    sSQL:=     'SELECT TGE101.CIADES,TGE101.CIADIRE,TGE101.CIATLF,TGE101.CIAFAX, ';
    sSQL:=sSQL+''' '' AS SCCID, '' ''  AS SCCFCH,'' '' AS ARTID, '' '' AS ARTIDES, ';
    sSQL:=sSQL+''' '' AS PROVDES,'' '' AS REFE1, '' '' AS REFE2, '' '' AS REFE3, ';
    sSQL:=sSQL+''' '' AS REFE4, '' ''  AS REFE5, '' '' AS REFE6, '' '' AS REFE7, ';
    sSQL:=sSQL+''' '' AS REFE8, '' ''  AS REFE9, '' '' AS REFE10,'' '' AS DETA1, ';
    sSQL:=sSQL+''' '' AS DETA2, '' ''  AS DETA3, '' '' AS DETA4, '' '' AS DETA5, ';
    sSQL:=sSQL+''' '' AS DETA6, '' ''  AS DETA7, '' '' AS DETA8, '' '' AS DETA9, ';
    sSQL:=sSQL+''' '' AS DETA10, '' '' AS PUNTO ';
    sSQL:=sSQL+'FROM TGE101 ';
    sSQL:=sSQL+'ORDER BY ARTID, PROVDES ';
  end
  else
	if SRV_D = 'ORACLE' then
  begin
    sSQL:=     'SELECT TGE101.CIADES, TGE101.CIADIRE, TGE101.CIATLF, TGE101.CIAFAX, ';
    sSQL:=sSQL+''' '' AS SCCID, '' '' AS SCCFCH, ''  '' AS ARTID, '' '' AS ARTIDES, ';
    sSQL:=sSQL+''' '' AS PROVDES,'' '' AS REFE1, '' '' AS REFE2, '' '' AS REFE3, ';
    sSQL:=sSQL+''' '' AS REFE4, '' '' AS REFE5, '' '' AS REFE6, '' '' AS REFE7, ';
    sSQL:=sSQL+''' '' AS REFE8, '' '' AS REFE9, '' '' AS REFE10, '' '' AS DETA1, ';
    sSQL:=sSQL+''' '' AS DETA2, '' '' AS DETA3, '' '' AS DETA4, '' '' AS DETA5, ';
    sSQL:=sSQL+''' '' AS DETA6, '' '' AS DETA7, '' '' AS DETA8, '' '' AS DETA9, ';
    sSQL:=sSQL+''' '' AS DETA10, '' '' AS PUNTO ';
    sSQL:=sSQL+'FROM TGE101 ';
    sSQL:=sSQL+'ORDER BY ARTID, PROVDES1';
  end;
  dm1.cdsEvalRep.Close;
  dm1.cdsEvalRep.DataRequest(sSQL);
  dm1.cdsEvalRep.Open;
  Z2bbtnOkSuma.Enabled := false;
  Z2bbtnOkPrint.Enabled := false;
end;

procedure TFEvalProf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  xActivo := False;
{  // E = Evaluado
  xSql := 'SELECT * FROM LOG302 WHERE PROFEVAL<>''E''';
  dm1.cdsSolCot.Close;
  dm1.cdsSolCot.DataRequest(xsql);
  dm1.cdsSolCot.open;
begin
  xActivo := False;
  { borra los datos para el DBcontrolgrid y para la sumatoria }
  //** 14/03/2001 - pjsv, xque salia error de que no esta open
  if xSqlAsignado = '1' then
   begin
    dm1.cdsEval.First;
    while not dm1.cdsEval.Eof do dm1.cdsEval.Delete;
    xSqlAsignado := '';
   end;
  if Length(xSqlAsignado) > 0 then
  begin
    dm1.cdsTotEval.First;
    while not dm1.cdsTotEval.Eof do
     dm1.cdsTotEval.Delete;
  end;
  dm1.cdsTotEval.Close;
  dm1.cdsEval.Close;
  dm1.cdsEvalRep.Close;
  { setea a 1 la fila y columna }
  DBCtrlGrid1.ColCount := 1;
  DBCtrlGrid1.RowCount := 1;
end;

procedure TFEvalProf.dbgSolCotDblClick(Sender: TObject);
var
 sSQL,xSQL : string;
 xCont : Integer ;
 xControl : TCustomEdit;
 xCaption : TCustomLabel;
 iX : integer; { contador }
 { variables para asignar los puntos por cada condición }
 vpto1,vpto2,vpto3,vpto4,vpto5,vpto6,vpto7,vpto8,vpto9,vpto10 : integer;
 xTot : Array[1..10] of Integer;
begin
	DBCtrlGrid1.ColCount := 1;
	DBCtrlGrid1.RowCount := 1;
  DBCtrlGrid1.Enabled := false;
 	{arma el Sql, crea por defe1cto 10 Referencias = descripciones de las condiciones,
   Puntos = a los puntos por c/u de las condiciones, tendencias = c/u de las condiciones
   jala datos de la cabecera y detalle de la proforma de acuerdo a la cotización
   escojida, de la tabla de compañia jala datos para el reporte }
  { se agrego los nombres CAMPO1..CAMPO10 para asociar el nombre del campo de la proforma }
 	xSQL := '';
 	xSQL := 'select ';
 	vsolcot := dm1.cdsSolCot.fieldbyname('SCCID').AsString;
  if (SRV_D = 'DB2NT') or
		 (SRV_D = 'DB2400') then
  begin
 		xSQL:='SELECT ''               '' AS REFE1, ''               '' AS REFE2, ''               '' AS REFE3, ''               '' AS REFE4, ''               '' AS REFE5,'+
            ' ''               '' AS REFE6, ''               '' AS REFE7, ''               '' AS REFE8, ''               '' AS REFE9, ''               '' AS REFE10,'+
            ' 0 AS PTOS1,0 AS PTOS2,0 AS PTOS3,0 AS PTOS4,0 AS PTOS5,'+
            ' 0 AS PTOS6,0 AS PTOS7,0 AS PTOS8,0 AS PTOS9,0 AS PTOS10,'+
            ' '''' AS TEND1,'''' AS TEND2,'''' AS TEND3,'''' AS TEND4,'''' AS TEND5,'+
            ' '''' AS TEND6,'''' AS TEND7,'''' AS TEND8,'''' AS TEND9,'''' AS TEND10,'+
            ''+dm1.wReplacCeros+'(LOG313.DPROFTEN,0) AS DPROFTEN,'+
            ' case when LOG313.DPROFGARDMA = ''A'' THEN '+dm1.wReplacCeros+'(LOG313.DPROFGARAN,0) * 12'+
            ' WHEN LOG313.DPROFGARDMA = ''M'' THEN '+dm1.wReplacCeros+'(LOG313.DPROFGARAN,0)'+
            ' WHEN LOG313.DPROFGARDMA = ''D'' THEN '+dm1.wReplacCeros+'(LOG313.DPROFGARAN,0) / 30'+
            ' END AS DPROFGARAN,'+
            ''+dm1.wReplacCeros+'(LOG313.DPROFVALID,0) AS DPROFVALID, LOG313.DPROFCONCOM,'+
            'LOG313.DPROFARTD, LOG313.DPROFPRVD, LOG313.ARTID, LOG312.PROV, LOG313.PROFID,'+
            'CASE WHEN LOG313.DPROFLAGUM = ''G'' THEN LOG313.DPROFPUNG ELSE LOG313.DPROFPUNU END PRECIO, '+
            'TGE101.CIADES, TGE101.CIADIRE, TGE101.CIATLF, TGE101.CIAFAX,'+
            ' '''' AS SCCID, 0 AS TOT0, 0 AS TOT1, 0 AS TOT2, 0 AS TOT3, 0 AS TOT4, 0 AS TOT5,'+
            ' 0 AS TOT6, 0 AS TOT7, 0 AS TOT8, 0 AS TOT9, 0 AS TOT10, LOG312.PROFEVAL,'+
            ' ''           '' Campo1, ''           '' Campo2, ''           '' Campo3, ''           '' Campo4, ''           '' Campo5,'+
            ' ''           '' Campo6, ''           '' Campo7, ''           '' Campo8, ''           '' Campo9, ''           '' Campo10,'+
            ' LOG313.DPROFLAGUM '+
            ' FROM LOG313, LOG312, TGE101'+
            ' WHERE LOG312.SCCID='+quotedStr(vsolcot)+
            ' AND LOG312.PROFID = LOG313.PROFID'+
			  		' AND LOG312.CIAID = TGE101.CIAID'+
            ' ORDER BY LOG313.ARTID, LOG312.PROV';
  end
  else
	if SRV_D = 'ORACLE' then
  begin
 		xSQL     :='SELECT ''               '' AS REFE1, ''               '' AS REFE2, ''               '' AS REFE3, ''               '' AS REFE4, ''               '' AS REFE5, ';
 		xSQL:=xSQL+'''               '' AS REFE6, ''               '' AS REFE7, ''               '' AS REFE8, ''               '' AS REFE9, ''               '' AS REFE10, ';
 		xSQL:=xSQL+'0 AS PTOS1,0 AS PTOS2,0 AS PTOS3,0 AS PTOS4,0 AS PTOS5, 0 AS PTOS6,0 AS PTOS7,0 AS PTOS8,0 AS PTOS9,0 AS PTOS10, ';
 		xSQL:=xSQL+''''' AS TEND1, '''' AS TEND2, '''' AS TEND3, '''' AS TEND4, '''' AS TEND5, '''' AS TEND6, '''' AS TEND7, '''' AS TEND8, '''' AS TEND9, '''' AS END10, '+dm1.wReplacCeros+'(LOG313.DPROFTEN,0) AS DPROFTEN, ';
 		xSQL:=xSQL+''+dm1.wReplacCeros+'(LOG313.DPROFVALID,0) AS DPROFVALID, LOG313.DPROFCONCOM,LOG313.DPROFARTD, LOG313.DPROFPRVD, LOG313.ARTID, LOG312.PROV, LOG313.PROFID, ';
 		xSQL:=xSQL+'TGE101.CIADES, TGE101.CIADIRE, TGE101.CIATLF, TGE101.CIAFAX, '''' AS SCCID, 0 AS TOT0, 0 AS TOT1, 0 AS TOT2, 0 AS TOT3, 0 AS TOT4, 0 AS TOT5, 0 AS TOT6, 0 AS TOT7, 0 AS TOT8, 0 AS TOT9, 0 AS TOT10, LOG312.PROFEVAL, ';
 		xSQL:=xSQL+'''           '' Campo1, ''           '' Campo2, ''           '' Campo3, ''           '' Campo4, ''           '' Campo5, ''           '' Campo6, ''           '' Campo7, ''           '' Campo8, ''           '' Campo9, ''           '' Campo10, LOG313.DPROFLAGUM, ';
 		xSQL:=xSQL+'DECODE(LOG313.DPROFLAGUM, ''G'', LOG313.DPROFPUNG, LOG313.DPROFPUNU) AS PRECIO, ';
 		xSQL:=xSQL+'DECODE(LOG313.DPROFGARDMA, ';
 		xSQL:=xSQL+'''A'', '+dm1.wReplacCeros+'(LOG313.DPROFGARAN,0)*12, ';
 		xSQL:=xSQL+'''M'', '+dm1.wReplacCeros+'(LOG313.DPROFGARAN,0), ';
 		xSQL:=xSQL+'''D'', '+dm1.wReplacCeros+'(LOG313.DPROFGARAN,0) / 30) AS PROFGARAN ';
 		xSQL:=xSQL+'FROM LOG313, LOG312, TGE101 ';
 		xSQL:=xSQL+'WHERE LOG312.SCCID='+quotedStr(vsolcot)+' ';
 		xSQL:=xSQL+'AND LOG312.PROFID = LOG313.PROFID ';
 		xSQL:=xSQL+'AND LOG312.CIAID = TGE101.CIAID ';
 		xSQL:=xSQL+'ORDER BY LOG313.ARTID, LOG312.PROV ';
  end;
 	dm1.cdsEval.Close;
 	dm1.cdsEval.ProviderName:='prvEval';
 	dm1.cdsEval.DataRequest(xSQL);
 	dm1.cdsEval.Open;
 	xSqlAsignado := '1';
  if (SRV_D = 'DB2NT') or
		 (SRV_D = 'DB2400') then
  begin
  	xSQL:='SELECT * FROM LOG101 '+
          'LEFT JOIN LOG105 ON (LOG101.CEVDESCRI = LOG105.CEVDESCRI) '+
          'WHERE (CCOABREV<>'''') AND  (CCOABREV IS NOT NULL) '+
          'ORDER BY CCOREL';
  end
  else
	if SRV_D = 'ORACLE' then
  begin
 		xSQL:=    'SELECT * FROM LOG101, LOG105 ';
 		xSQL:=xSQL+'WHERE (CCOABREV<>'''') ';
 		xSQL:=xSQL+'AND (CCOABREV IS NOT NULL) ';
 		xSQL:=xSQL+'AND LOG101.CEVDESCRI = LOG105.CEVDESCRI(+) ';
 		xSQL:=xSQL+'ORDER BY CCOREL ';
  end;
 	dm1.cdsConCom.close;
 	dm1.cdsConCom.DataRequest(xSQL);
 	dm1.cdsConCom.open;
 	dm1.cdsEval.first;
 	dm1.cdsConCom.first;
 	while not dm1.cdsEval.Eof do
  begin
  	dm1.cdsEval.Edit;
   	dm1.cdsConCom.first;
   	For ix := 1 to dm1.cdsConCom.recordcount do
     begin
      // se asigna los datos desde la tabla de condicioes de evaluacion
    	dm1.cdsEval.FieldByName('REFE'+IntToStr(ix)).AsString := dm1.cdsConCom.fieldbyname('CCOABREV').AsString;
      dm1.cdsEval.FieldByName('PTOS'+IntToStr(ix)).AsString := dm1.cdsConCom.fieldbyname('CCOPTOS').AsString;
      dm1.cdsEval.FieldByName('TEND'+IntToStr(ix)).AsString := dm1.cdsConCom.fieldbyname('CCOTEND').AsString;
      // si la unidad de medida es general
      If dm1.cdsEval.FieldByName('DPROFLAGUM').AsString = 'G' then
       begin
        // se toma el nombre del campo referente el precio general
        If (dm1.cdsConCom.fieldbyname('CEVCAMPO').AsString = 'DPROFPUNG') then
         dm1.cdsEval.FieldByName('CAMPO'+IntToStr(ix)).AsString := 'PRECIO'
        else
         // si es otro, se comprueba que no sea el precio unitario
         If (dm1.cdsConCom.fieldbyname('CEVCAMPO').AsString <> 'DPROGPUNU') then
          dm1.cdsEval.FieldByName('CAMPO'+IntToStr(ix)).AsString := dm1.cdsConCom.fieldbyname('CEVCAMPO').AsString;
       end
      else // si la unidad de medida es unitaria, el resto es IDEM
       begin
        If (dm1.cdsConCom.fieldbyname('CEVCAMPO').AsString = 'DPROGPUNU') then
         dm1.cdsEval.FieldByName('CAMPO'+IntToStr(ix)).AsString := 'PRECIO'
        else
         If (dm1.cdsConCom.fieldbyname('CEVCAMPO').AsString <> 'DPROFPUNG') then
          dm1.cdsEval.FieldByName('CAMPO'+IntToStr(ix)).AsString := dm1.cdsConCom.fieldbyname('CEVCAMPO').AsString;
       end;
      // si la tendencia es menor
      If dm1.cdsEval.FieldByName('TEND'+IntToStr(ix)).AsString = '<' then
       begin
        if dm1.cdsEval.fieldbyname('CAMPO'+IntToStr(ix)).AsString <> '' then
         // se pasa a negativo el puntaje
         xTot[ix]:=(StrToInt(dm1.cdsEval.FieldByName('PTOS'+IntToStr(ix)).AsString) * dm1.cdsEval.fieldbyname(dm1.cdsEval.fieldbyname('CAMPO'+IntToStr(ix)).AsString).value)*-1;
       end
      else
       begin
        if dm1.cdsEval.fieldbyname('CAMPO'+IntToStr(ix)).AsString <> '' then
         xTot[ix]:=StrToInt(dm1.cdsEval.FieldByName('PTOS'+IntToStr(ix)).AsString) * dm1.cdsEval.fieldbyname(dm1.cdsEval.fieldbyname('CAMPO'+IntToStr(ix)).AsString).value;
       end;
      // si hay dato a mostrar
      if dm1.cdsEval.fieldbyname('CAMPO'+IntToStr(ix)).AsString <> '' then
       case ix of
        1: begin
            dbtCond1.visible := true; dbeCond1 .visible := true;
            dbeCond1.DataField := dm1.cdsEval.fieldbyname('CAMPO'+IntToStr(ix)).AsString;
           end;
        2: begin
            dbtCond2.visible := true; dbeCond2 .visible := true;
            dbeCond2.DataField := dm1.cdsEval.fieldbyname('CAMPO'+IntToStr(ix)).AsString;
           end;
        3: begin
            dbtCond3.visible := true; dbeCond3 .visible := true;
            dbeCond3.DataField := dm1.cdsEval.fieldbyname('CAMPO'+IntToStr(ix)).AsString;
           end;
        4: begin
            dbtCond4.visible := true; dbeCond4 .visible := true;
            dbeCond4.DataField := dm1.cdsEval.fieldbyname('CAMPO'+IntToStr(ix)).AsString;
           end;
        5: begin
            dbtCond5.visible := true; dbeCond5 .visible := true;
            dbeCond5.DataField := dm1.cdsEval.fieldbyname('CAMPO'+IntToStr(ix)).AsString;
           end;
        6: begin
            dbtCond6.visible := true; dbeCond6 .visible := true;
            dbeCond6.DataField := dm1.cdsEval.fieldbyname('CAMPO'+IntToStr(ix)).AsString;
           end;
        7: begin
            dbtCond7.visible := true; dbeCond7 .visible := true;
            dbeCond7.DataField := dm1.cdsEval.fieldbyname('CAMPO'+IntToStr(ix)).AsString;
           end;
        8: begin
            dbtCond8.visible := true; dbeCond8 .visible := true;
            dbeCond8.DataField := dm1.cdsEval.fieldbyname('CAMPO'+IntToStr(ix)).AsString;
           end;
        9: begin
            dbtCond9.visible := true; dbeCond9 .visible := true;
            dbeCond9.DataField := dm1.cdsEval.fieldbyname('CAMPO'+IntToStr(ix)).AsString;
           end;
        10: begin
            dbtCond10.visible := true; dbeCond10 .visible := true;
            dbeCond10.DataField := dm1.cdsEval.fieldbyname('CAMPO'+IntToStr(ix)).AsString;
           end;
       end;
      	dm1.cdsConCom.next;
    	end;
      // se halla el total del puntaje y se de los sub putajes
      dm1.cdsEval.FieldByName('TOT0').value := xTot[1]+xTot[2]+xTot[3]+xTot[4]+xTot[5]+xTot[6]+xTot[7]+xTot[8]+xTot[9]+xTot[10];
      dm1.cdsEval.FieldByName('TOT1').value := xTot[1];
      dm1.cdsEval.FieldByName('TOT2').value := xTot[2];
      dm1.cdsEval.FieldByName('TOT3').value := xTot[3];
      dm1.cdsEval.FieldByName('TOT4').value := xTot[4];
      dm1.cdsEval.FieldByName('TOT5').value := xTot[5];
      dm1.cdsEval.FieldByName('TOT6').value := xTot[6];
      dm1.cdsEval.FieldByName('TOT7').value := xTot[7];
      dm1.cdsEval.FieldByName('TOT8').value := xTot[8];
      dm1.cdsEval.FieldByName('TOT9').value := xTot[9];
      dm1.cdsEval.FieldByName('TOT10').value:= xTot[10];
   		dm1.cdsEval.post;
   		dm1.cdsEval.Next;
  	 end;
	vCol := 0;
 	{ recorre la cabecera de la proforma para calcular el total de proveedore para
   la solicitud escogida para que cree tantas columnas como proveedores hallan
   para la solicitud }
 	dm1.cdsProforma.open;
 	dm1.cdsProforma.First;
 	while not dm1.cdsProforma.eof do
  begin
  	if dm1.cdsProforma.fieldbyname('SCCID').AsString = vsolcot then
    vCol := vCol + 1;
   	dm1.cdsProforma.Next;
  end;
 	{ le asigna el nuevo # de columnas }
 	DBCtrlGrid1.ColCount := vCol;
 	{ filtra la tabla de detalle de solicitud de cotización por la cotización
   escogida, me da como resultado el total de articulos que tiene la cotización
   para crear tantas filas como articulos tenga la solicitud}
 	ssql := '';
 	ssql := 'SELECT * FROM LOG303 WHERE LOG303.SCCID=' + quotedStr(vsolcot);
 	dm1.cdsDSolCot.Close;
 	dm1.cdsDSolCot.ProviderName:='prvDSolCot';
 	dm1.cdsDSolCot.DataRequest(sSQL);
 	dm1.cdsDSolCot.Open;
 	{ se asigna el # de filas }
 	DBCtrlGrid1.RowCount := dm1.cdsDSolCot.RecordCount;
 	{ valida si el client armado tiene datos para activar los botnes }
 	if dm1.cdsEval.RecordCount > 0 then
  begin
  	DBCtrlGrid1.Enabled := true;
   	Z2bbtnOkSuma.Enabled := true;
   	Z2bbtnOkPrint.Enabled := true;
  end
 	else
  begin
  	Z2bbtnOkSuma.Enabled := false;
   	Z2bbtnOkPrint.Enabled := false;
		//Z2bbtnOkUpDate.Enabled := false;
  end;
  { setea el ancho y alto de los paneles del DBControlGrid }
  //** 14/03/2001 - pjsv
  If dbtCond1.Visible then
   if dbtCond2.Visible then
    if dbtCond3.Visible then
     if dbtCond4.Visible then
      if dbtCond5.Visible then
       if dbtCond6.Visible then
        if dbtCond7.Visible then
         if dbtCond8.Visible then
          if dbtCond9.Visible then
           if dbtCond10.Visible then
            begin
             lblTotPun.Top  := dbtCond10.Top + dbtCond10.Height + 4;
             dbeTotPun.Top  := dbtCond10.Top + dbtCond10.Height + 4;
             DBCtrlGrid1.PanelHeight := 295;
            end
           else
            begin
             lblTotPun.Top  := dbtCond9.Top + dbtCond9.Height + 4;
             dbeTotPun.Top  := dbtCond9.Top + dbtCond9.Height + 4;
             DBCtrlGrid1.PanelHeight := 269;
            end
          else
            begin
             lblTotPun.Top  := dbtCond8.Top + dbtCond8.Height + 4;
             dbeTotPun.Top  := dbtCond8.Top + dbtCond8.Height + 4;
             DBCtrlGrid1.PanelHeight := 247;
            end
         else
            begin
             lblTotPun.Top  := dbtCond7.Top + dbtCond7.Height + 4;
             dbeTotPun.Top  := dbtCond7.Top + dbtCond7.Height + 4;
             DBCtrlGrid1.PanelHeight := 225;
            end
        else
            begin
             lblTotPun.Top  := dbtCond6.Top + dbtCond6.Height + 4;
             dbeTotPun.Top  := dbtCond6.Top + dbtCond6.Height + 4;
             DBCtrlGrid1.PanelHeight := 203;
            end
       else
            begin
             lblTotPun.Top  := dbtCond5.Top + dbtCond5.Height + 4;
             dbeTotPun.Top  := dbtCond5.Top + dbtCond5.Height + 4;
             DBCtrlGrid1.PanelHeight := 182;
            end
      else
            begin
             lblTotPun.Top  := dbtCond4.Top + dbtCond4.Height + 4;
             dbeTotPun.Top  := dbtCond4.Top + dbtCond4.Height + 4;
             DBCtrlGrid1.PanelHeight := 161;
            end
     else
            begin
             lblTotPun.Top  := dbtCond3.Top + dbtCond3.Height + 4;
             dbeTotPun.Top  := dbtCond3.Top + dbtCond3.Height + 4;
             DBCtrlGrid1.PanelHeight := 140;
            end
    else
            begin
             lblTotPun.Top  := dbtCond2.Top + dbtCond2.Height + 4;
             dbeTotPun.Top  := dbtCond2.Top + dbtCond2.Height + 4;
             DBCtrlGrid1.PanelHeight := 118;
            end
   else
            begin
             lblTotPun.Top  := dbtCond1.Top + dbtCond1.Height + 4;
             dbeTotPun.Top  := dbtCond1.Top + dbtCond1.Height + 4;
             DBCtrlGrid1.PanelHeight := 98;
            end
  else
             DBCtrlGrid1.PanelHeight := 54;

  DBCtrlGrid1.PanelWidth := 172;
  DBCtrlGrid1.Refresh;
end;

{ recalcula }
procedure TFEvalProf.dbeCond6Exit(Sender: TObject);
var
 vpto1,vpto2,vpto3,vpto4,vpto5,vpto6,vpto7,vpto8,vpto9,vpto10 : integer;
begin
 dm1.cdsEval.Edit;
   If dm1.cdsEval.FieldByName('TEND1').AsString = '<' then
    vpto1:=(StrToInt(dm1.cdsEval.FieldByName('PTOS1').AsString) * dm1.cdsEval.fieldbyname('DPROFTEN').value)*-1
   else
    vpto1:=StrToInt(dm1.cdsEval.FieldByName('PTOS1').AsString) * dm1.cdsEval.fieldbyname('DPROFTEN').value;
   If dm1.cdsEval.FieldByName('TEND2').AsString = '<' then
    vpto2:= (StrToInt(dm1.cdsEval.FieldByName('PTOS2').AsString) * dm1.cdsEval.fieldbyname('DPROFGARAN').value)*-1
   else
    vpto2:= StrToInt(dm1.cdsEval.FieldByName('PTOS2').AsString) * dm1.cdsEval.fieldbyname('DPROFGARAN').value;
   If dm1.cdsEval.FieldByName('TEND3').AsString = '<' then
    vpto2:= (StrToInt(dm1.cdsEval.FieldByName('PTOS3').AsString) * dm1.cdsEval.fieldbyname('DPROFVALID').value)*-1
   else
    vpto3:= StrToInt(dm1.cdsEval.FieldByName('PTOS3').AsString) * dm1.cdsEval.fieldbyname('DPROFVALID').value;
   If dm1.cdsEval.FieldByName('TEND4').AsString = '<' then
    vpto4:= (StrToInt(dm1.cdsEval.FieldByName('PTOS4').AsString) * dm1.cdsEval.fieldbyname('PRECIO').value)*-1
   else
    vpto4:= StrToInt(dm1.cdsEval.FieldByName('PTOS4').AsString) * dm1.cdsEval.fieldbyname('PRECIO').value;
   If dm1.cdsEval.FieldByName('TEND5').AsString = '<' then
    vpto5:= (StrToInt(dm1.cdsEval.FieldByName('PTOS5').AsString))*-1
   else
    vpto5:= StrToInt(dm1.cdsEval.FieldByName('PTOS5').AsString);
   If dm1.cdsEval.FieldByName('TEND6').AsString = '<' then
    vpto6:= StrToInt(dbeCond1.Text)*-1
   else
    vpto6:= StrToInt(dbeCond1.Text);
   If dm1.cdsEval.FieldByName('TEND7').AsString = '<' then
    vpto7:= StrToInt(dbeCond2.Text)*-1
   else
    vpto7:= StrToInt(dbeCond2.Text);
   If dm1.cdsEval.FieldByName('TEND8').AsString = '<' then
    vpto8:= StrToInt(dbeCond3.Text)*-1
   else
    vpto8:= StrToInt(dbeCond3.Text);
   If dm1.cdsEval.FieldByName('TEND9').AsString = '<' then
    vpto9:= StrToInt(dbeCond4.Text)*-1
   else
    vpto9:= StrToInt(dbeCond4.Text);
   If dm1.cdsEval.FieldByName('TEND10').AsString = '<' then
    vpto10:= StrToInt(dbeCond5.Text)*-1
   else
    vpto10:= StrToInt(dbeCond5.Text);
 if dm1.cdsEval.fieldbyname('DPROFCONCOM').value = 'C' then
  vpto5 := 0 + vpto5 // si es contado aumenta, sino resta, suponiendo que mas pesa al credito
 else vpto5 := 0 - vpto5;
 dm1.cdsEval.FieldByName('TOT1').value := vpto1+vpto2+vpto3+vpto4+vpto5+vpto6+vpto7+vpto8+vpto9+vpto10;
 dm1.cdsEval.post;
end;

{ sumatoria de lo puntajes por proveedor }
procedure TFEvalProf.Z2bbtnOkSumaClick(Sender: TObject);
begin
//  If dm1.cdsEval.fieldbyname('PROFEVAL').Asstring = 'P' then
//   begin
    sumatoria;
    pnlTP.Visible := true;
//   end
//  else Showmessage('La Proforma ya fue evaluada'); 
end;

{ hablita el panel para registrar la evalución }
procedure TFEvalProf.Z2bbtnOkEvalClick(Sender: TObject);
var
 ssql : string;
begin
  Z2bbtnOkEval.Enabled := false;
  Z2bbtnOkPrint.Enabled := false;
  Z2bbtnCancelEval.Enabled := false;
  dbgResultado.Enabled := false;
  dbrgVisado.ItemIndex := 1;
  ssql := '';
  ssql := 'PROFID=' + quotedstr(dm1.cdsTotEval.fieldbyname('PROFID').AsString);
  dbreMotivos.Text := dm1.displaydescrip('prvProforma','LOG312','PROFOBS',ssql,'PROFOBS');

  edtDatosProf.Text := 'Proforma:'+dm1.cdsTotEval.fieldbyname('PROFID').AsString+','
                      +' Proveedor:'+dm1.cdsTotEval.fieldbyname('PROVDES').AsString+','
                      +' Total:'+dm1.cdsTotEval.fieldbyname('TOTAL').AsString+','
                      +' Estado Actual :'+dm1.cdsTotEval.fieldbyname('EVALU').AsString;

  pnlVisar.Visible := true;
end;

{ imprime el total de la evalución }
procedure TFEvalProf.Z2bbtnOkPrint1Click(Sender: TObject);
begin
 pnlTP.Enabled := false;
 ppReport2.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\EvalProAcep.Rtm';
 ppReport2.template.LoadFromFile ;
 ppReport2.Print;
 pnlTP.Enabled := true;
end;

{ cierra el panel del total de la evalución }
procedure TFEvalProf.Z2bbtnCancelEvalClick(Sender: TObject);
begin
   pnlSolCot.Enabled := true;
   pnlTP.Visible := false;
   DBCtrlGrid1.Enabled := true;
end;

{ graba(post) la evalución asignada }
procedure TFEvalProf.Z2bbtnOkResulClick(Sender: TObject);
var
 vestado,vestdes : string;
begin
  Screen.Cursor:=crHourGlass;
   vestado := dbrgVisado.Value;
   vestdes := '';
   if vestado = 'A' then
    vestdes := 'Evaluado y Aceptado';
   if vestado = 'D' then
    vestdes := 'Evaluado y Descartado';
   dm1.cdsDProforma.Open;
   dm1.cdsDProforma.First;
   while not dm1.cdsDProforma.Eof do
    begin
     if dm1.cdsDProforma.fieldbyname('PROFID').AsString = dm1.cdsTotEval.FieldByName('PROFID').AsString then
      begin
       dm1.cdsDProforma.Edit;
       dm1.cdsDProforma.FieldByName('DPROFEVAL').value := vestado;
       //** 19/03/2001 - pjsv
       dm1.cdsDProforma.Post;
       //**
      end;
     dm1.cdsDProforma.Next;
    end;
//** 19/03/2001 - pjsv
     dm1.cdsDProforma.ApplyUpdates(0);
//   dm1.ControlTran;
//**
   dm1.cdsProforma.Open;
   dm1.cdsProforma.First;
   while not dm1.cdsProforma.Eof do
    begin
     if dm1.cdsProforma.fieldbyname('PROFID').AsString = dm1.cdsTotEval.FieldByName('PROFID').AsString then
      begin
       dm1.cdsProforma.Edit;
       dm1.cdsProforma.FieldByName('PROFEVAL').value := vestado;
       dm1.cdsProforma.FieldByName('PROFOBS').value := dbreMotivos.Text;
       dm1.cdsProforma.Post;
      end;
     dm1.cdsProforma.Next;
    end;
    //** 19/03/2001 - pjsv
    dm1.cdsProforma.ApplyUpdates(0);
    //dm1.ControlTran;
    //**
    //** 05/04/2001 - pjsv
    dm1.cdsSolCot.Edit;
    dm1.cdsSolCot.fieldbyname('PROFEVAL').AsString :='E';
    dm1.cdsSolCot.Post;
    dm1.cdsSolCot.ApplyUpdates(0);
    //**
    dm1.cdsTotEval.Edit;
    dm1.cdsTotEval.FieldByName('EVALU').AsString := vestdes;
    dm1.cdsTotEval.Post;
    Screen.Cursor:=crDefault;
    Z2bbtnCancelResul.Click;
end;

{ cierra el panel de motivos de evaluación }
procedure TFEvalProf.Z2bbtnCancelResulClick(Sender: TObject);
begin
  dblcMotivos.Enabled := false;
  dbreMotivos.Clear;
  dbreMotivos.Enabled := false;
  pnlVisar.Visible := false;
  Z2bbtnOkEval.Enabled := true;
  Z2bbtnCancelEval.Enabled := true;
  Z2bbtnOkPrint.Enabled := true;
  dbgResultado.Enabled := true;
end;

{ escoge si es aceptado o descartado}
procedure TFEvalProf.dbrgVisadoChange(Sender: TObject);
var
 vcaliftip,ssql : string;
begin
   dblcMotivos.Clear;
   If dbrgVisado.ItemIndex = 0 Then
     begin
      vcaliftip := 'A';
      lblMotivos.Caption := 'Motivos de Calificación'
     end;
   If dbrgVisado.ItemIndex = 1 Then
     begin
      vcaliftip := 'D';
      lblMotivos.Caption := 'Motivos de Descalificación'
     end;
   { para filtar el dblcMotivos por el timo de evaluación }
   ssql := '';
   ssql := 'Select * FROM TGE172 WHERE TGE172.CALIFTIP ='+quotedstr(vcaliftip);
   dm1.cdsMotivos.Close;
   dm1.cdsMotivos.ProviderName:='prvMotivos';
   dm1.cdsMotivos.DataRequest(sSQL);
   dm1.cdsMotivos.Open;
   dm1.cdsMotivos.First;
   dblcMotivos.Enabled := true;
   dbreMotivos.Enabled := true;
   //** 052/04/2001 - pjsv, para que vuelve a carga lo inicial
   if xActivo Then
    begin
     ssql := '';
     ssql := 'PROFID=' + quotedstr(dm1.cdsTotEval.fieldbyname('PROFID').AsString);
     dbreMotivos.Text := dm1.displaydescrip('prvProforma','LOG312','PROFOBS',ssql,'PROFOBS');
    end;
   //**
end;

{ displaya de los motivos de la evaliación (Aceptada o descartada) }
procedure TFEvalProf.dblcMotivosChange(Sender: TObject);
var
 Vmotivo : string;
begin
   If dbrgVisado.ItemIndex = 0 then
     vmotivo := 'Aceptado por ' + dblcMotivos.Text; //+', '+#13;
   If dbrgVisado.ItemIndex = 1 then
    vmotivo := 'Descartado por ' + dblcMotivos.Text; //+', '+#13;
   If dblcMotivos.Text <> '' then
    If Length(dbreMotivos.Text) > 0 then
     dbreMotivos.Text := dbreMotivos.Text+', '+#13+vmotivo
    else
     dbreMotivos.Text := vmotivo;    
end;

{ imprime la evaluación }
procedure TFEvalProf.Z2bbtnOkPrintClick(Sender: TObject);
begin
	sumatoria;
 	ppReport3.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\EvalProTot.rtm';
 	ppReport3.template.LoadFromFile ;
 	ppReport3.Print;
 	ppReport3.Stop; 
 	pnlSolCot.Enabled := true;
 	DBCtrlGrid1.Enabled := true;
end;

{ antes de imprimir la evaluación }
procedure TFEvalProf.ppReport1BeforePrint(Sender: TObject);
begin
   { por defecto se deja en 3 columnas }
   ppReport1.PrinterSetup.PaperWidth := ppReport1.ColumnWidth * 3;  //vcol;
{  esta linea ya no por lo que se deja en 3 por defecto y no por la cantidad de
   proveedores que puede tener la solicitud
   ppReport1.Columns := vcol;}
   ppLblTit.Left := (ppReport1.PrinterSetup.PaperWidth / 2) - (ppLblTit.Width / 2);
   ppLn1.Width := ppReport1.PrinterSetup.PaperWidth - (ppReport1.PrinterSetup.MarginLeft + ppReport1.PrinterSetup.MarginRight) ;
   ppDBTSccid.Left := ppReport1.PrinterSetup.PaperWidth - (ppDBTSccid.Width + 20 + ppReport1.PrinterSetup.MarginLeft + ppReport1.PrinterSetup.MarginRight);
   ppLblSCCID.Left := ppDBTSccid.Left - (ppLblSCCID.Width + 5);
end;



procedure TFEvalProf.ppReport3BeforePrint(Sender: TObject);
begin
   ppLblTitR3.Left := (ppReport3.PrinterSetup.PaperWidth / 2) - (ppLblTitR3.Width / 2);
   ppLblTit2.Left := (ppReport3.PrinterSetup.PaperWidth / 2) - (ppLblTitR3.Width / 2);
   ppLn1R3.Width := ppReport3.PrinterSetup.PaperWidth - (ppReport3.PrinterSetup.MarginLeft + ppReport3.PrinterSetup.MarginRight) ;
   ppDBTSccidR3.Left := ppReport3.PrinterSetup.PaperWidth - (ppDBTSccidR3.Width + 20 + ppReport3.PrinterSetup.MarginLeft + ppReport3.PrinterSetup.MarginRight);
   ppLblSccidR3.Left := ppDBTSccidR3.Left - (ppLblSccidR3.Width + 5);
end;

procedure TFEvalProf.ppReport2BeforePrint(Sender: TObject);
begin
   ppLblTotEval.Left := (ppReport2.PrinterSetup.PaperWidth / 2) - (ppLblTotEval.Width / 2);
   ppLnTE1.Width := ppReport2.PrinterSetup.PaperWidth - (ppReport2.PrinterSetup.MarginLeft + ppReport2.PrinterSetup.MarginRight) ;
end;

procedure TFEvalProf.Sumatoria;
var
 ssql : string;
 vtotal : integer;
begin
	//if dm1.cdsTotEval.RecordCount <>0 then
  begin
      pnlSolCot.Enabled := false;
      dbreMotivos.Clear;
      DBCtrlGrid1.Enabled := false;
      { arma el client de la sumatoria }
      ssql := '';
      if (SRV_D = 'DB2NT') or
         (SRV_D = 'DB2400') then
      begin
        sSQL:=     'SELECT LOG312.PROV, LOG312.PROFID,TGE201.PROVDES, 0 AS TOTAL, ';
        sSQL:=sSQL+'CASE WHEN LOG312.PROFEVAL = ''P'' THEN ''Pendiente por Evaluar'' END EVALU0, ';
        sSQL:=sSQL+'CASE WHEN LOG312.PROFEVAL = ''A'' THEN ''Evaluado y Aceptado''   END EVALU1, ';
        sSQL:=sSQL+'CASE WHEN LOG312.PROFEVAL = ''D'' THEN ''Evaluado y Descartado'' END EVALU2, ';
        sSQL:=sSQL+'''                         '' AS EVALU, ';
        sSQL:=sSQL+'LOG312.SCCID ';
        sSQL:=sSQL+'FROM LOG312, TGE201 ';
        sSQL:=sSQL+'WHERE LOG312.SCCID='+quotedstr(vsolcot);
        sSQL:=sSQL+' AND LOG312.PROV=TGE201.PROV ';
      end
      else
      if SRV_D = 'ORACLE' then
      begin
        sSQL:=     'SELECT LOG312.PROV, LOG312.PROFID,TGE201.PROVDES, 0 AS TOTAL, ';
        sSQL:=sSQL+'DECODE(LOG312.PROFEVAL, ''P'', ''Pendiente por Evaluar'') AS EVALU0, ';
        sSQL:=sSQL+'DECODE(LOG312.PROFEVAL, ''A'', ''Evaluado y Aceptado'') AS EVALU1, ';
        sSQL:=sSQL+'DECODE(LOG312.PROFEVAL, ''D'', ''Evaluado y Descartado'') AS EVALU2, ';
        sSQL:=sSQL+'''                         '' AS EVALU, ';
        sSQL:=sSQL+'LOG312.SCCID ';
        sSQL:=sSQL+'FROM LOG312,TGE201 ';
        sSQL:=sSQL+'WHERE LOG312.SCCID='+quotedstr(vsolcot);
        sSQL:=sSQL+'AND LOG312.PROV=TGE201.PROV ';
      end;

      dm1.cdsTotEval.Close;
      dm1.cdsTotEval.ProviderName:='prvTotEval';
      dm1.cdsTotEval.DataRequest(sSQL);
      dm1.cdsTotEval.Open;
      dm1.cdsTotEval.First;
      while not dm1.cdsTotEval.eof do
      begin
        dm1.cdsEval.First;
        vtotal := 0;
        while not dm1.cdsEval.eof do
         begin
          { recorre el client de evaluciones y compara al proveedor con el proveedor
            del client del Totales de evaluación para ir sumando }
          if dm1.cdsEval.fieldbyname('PROV').AsString = dm1.cdsTotEval.fieldbyname('PROV').AsString then
            vtotal := vtotal + dm1.cdsEval.fieldbyname('TOT0').value;
          dm1.cdsEval.Next;
          end;
        { le asigna la evaluación }
        dm1.cdsTotEval.Edit;
        if dm1.cdsTotEval.fieldbyname('EVALU0').AsString <> '' then
         dm1.cdsTotEval.fieldbyname('EVALU').AsString := dm1.cdsTotEval.fieldbyname('EVALU0').AsString;
        if dm1.cdsTotEval.fieldbyname('EVALU1').AsString <> '' then
         dm1.cdsTotEval.fieldbyname('EVALU').AsString := dm1.cdsTotEval.fieldbyname('EVALU1').AsString;
        if dm1.cdsTotEval.fieldbyname('EVALU2').AsString <> '' then
         dm1.cdsTotEval.fieldbyname('EVALU').AsString := dm1.cdsTotEval.fieldbyname('EVALU2').AsString;
        dm1.cdsTotEval.fieldbyname('TOTAL').Value := vtotal;
        dm1.cdsTotEval.Post;
        dm1.cdsTotEval.Next;
      end;
  end;
  dm1.cdsTotEval.First;
  dbgResultado.Refresh;
end;

procedure TFEvalProf.ppReport2PreviewFormCreate(Sender: TObject);
begin
  ppReport2.PreviewForm.ClientHeight := 500;
  ppReport2.PreviewForm.ClientWidth := 650;
  tppviewer(ppReport2.PreviewForm.Viewer).zoomSetting := zspageWidth;
end;

procedure TFEvalProf.ppReport3PreviewFormCreate(Sender: TObject);
begin
  ppReport3.PreviewForm.ClientHeight := 500;
  ppReport3.PreviewForm.ClientWidth := 650;
  tppviewer(ppReport3.PreviewForm.Viewer).zoomSetting := zspageWidth;
end;

procedure TFEvalProf.ppReport1PreviewFormCreate(Sender: TObject);
begin
  ppReport1.PreviewForm.ClientHeight := 500;
  ppReport1.PreviewForm.ClientWidth := 650;
  tppviewer(ppReport1.PreviewForm.Viewer).zoomSetting := zspageWidth;
end;

procedure TFEvalProf.FormActivate(Sender: TObject);
begin
  xActivo := True;
end;

END.
