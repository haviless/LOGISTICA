unit LOG710;

// vhndema 20051227
// se cambio la consulta y se hicieron reportes a solicitud de
// MPalaco y FPazos

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls,DB, Grids, Wwdbigrd, Wwdbgrid, ppCtrls,
  ppVar, ppPrnabl, ppClass, ppDB, ppBands, ppCache, ppDBPipe, ppComm,
  ppRelatv, ppProd, ppReport,ppViewr, wwdblook, Spin, Wwdbdlg,
  ppEndUsr, MsgDlgs;

type
  TFToolConAnno = class(TForm)
    pnlTool: TPanel;
    Timer1: TTimer;
    ppr1: TppReport;
    ppdb1: TppDBPipeline;
    ppd1: TppDesigner;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblProv: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Bevel1: TBevel;
    Label8: TLabel;
    Bevel2: TBevel;
    bbtOk: TBitBtn;
    dblcCia: TwwDBLookupCombo;
    dblcGrpArti: TwwDBLookupCombo;
    dblcTipInv: TwwDBLookupCombo;
    seAno: TSpinEdit;
    rgTipo: TRadioGroup;
    dblcFAM: TwwDBLookupCombo;
    dblcSubFAM: TwwDBLookupCombo;
    dblcdProv: TwwDBLookupComboDlg;
    dbeProv: TEdit;
    dblcdMarca: TwwDBLookupComboDlg;
    edtMarca: TEdit;
    dblcdArtTipo: TwwDBLookupComboDlg;
    edtTipArt: TEdit;
    dblcAlmacen: TwwDBLookupCombo;
    edtAlmacen: TEdit;
    edtTinv: TEdit;
    edtCia: TEdit;
    dbeGrpArti: TEdit;
    dbeFAM: TEdit;
    dbeSFAM: TEdit;
    GroupBox1: TGroupBox;
    bbtnEneJun: TBitBtn;
    bbtnJulDic: TBitBtn;
    GroupBox2: TGroupBox;
    bbtnMes: TBitBtn;
    seMes: TSpinEdit;
    rgPeriodo: TRadioGroup;
    cbDisenoRep: TCheckBox;
    sbDisenoRep: TSpeedButton;
    procedure bbtOkClick(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure dblcTipInvExit(Sender: TObject);
		procedure dblcNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure dblcLocalidadExit(Sender: TObject);
    procedure dblcdProvExit(Sender: TObject);
    procedure dblcdMarcaExit(Sender: TObject);
    procedure dblcdArtTipoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblcGrpArtiExit(Sender: TObject);
    procedure dblcFAMExit(Sender: TObject);
    procedure dblcSubFAMExit(Sender: TObject);
    procedure bbtnEneJunClick(Sender: TObject);
    procedure dblcFAMEnter(Sender: TObject);
    procedure dblcSubFAMEnter(Sender: TObject);
    procedure bbtnJulDicClick(Sender: TObject);
    procedure dblcAlmacenExit(Sender: TObject);
    procedure bbtnMesClick(Sender: TObject);
    procedure sbDisenoRepClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sWhere:String;
  end;

var
  FToolConAnno: TFToolConAnno;
  xAccesoBotones : Boolean;

implementation
  Uses oaAD5000, LOGDM1;
{$R *.DFM}

procedure TFToolConAnno.bbtOkClick(Sender: TObject);
var
   scad3, cFamdes, cSFamDes : string;
   Y, M, D   : Word;
begin
 DecodeDate(DateS, Y, M, D);
 if dblcCia.text='' then
 begin
		ErrorMsg('Adquisiciones', ' Debe Escoger una Compañia ');
		dblcCia.SetFocus;
  exit;
	end;
{
  if dblcLocalidad.text='' then
  begin
		ErrorMsg('Adquisiciones', ' Debe Escoger una Localidad ');
		dblcLocalidad.SetFocus;
    exit;
	end;
}
 if dblcTipInv.text='' then
 begin
		ErrorMsg('Adquisiciones', ' Debe Escoger un Tipo de Inventario ');
		dblcTipInv.SetFocus;
  exit;
	end;

  if dblcGrpArti.text='' then
  begin
		ErrorMsg('Adquisiciones', ' Debe Escoger una Linea ó Grupo ');
		dblcGrpArti.SetFocus;
    exit;
	end;

  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   sWhere:=' WHERE NISATIP=''SALIDA'' AND LOG315.CIAID='+quotedStr(dblcCia.text)+' AND LOG315.TINID='+quotedStr(dblcTipInv.text)
  else
   if SRV_D = 'ORACLE' then
     sWhere:=' AND NISATIP=''SALIDA'' AND LOG315.CIAID='+quotedStr(dblcCia.text)+' AND LOG315.TINID='+quotedStr(dblcTipInv.text);
{
 if dblcLocalidad.text<>'' then
    sWhere:=sWhere+' AND LOG315.LOCID='+quotedStr(dblcLocalidad.text);
}
 if dblcGrpArti.text<>'' then
    sWhere:=sWhere+' AND LOG315.GRARID='+quotedStr(dblcGrpArti.text);
 {
 if rgPeriodo.ItemIndex=1 then //Mensual
 begin
  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
//  scad3:='SELECT 0 A'+IntToStr(Y)+',0 A'+IntToStr(Y-1)+',0 A'+IntToStr(Y-2)+',0 A'+IntToStr(Y-3)+', '+
  scad3:='SELECT 0 ANOACT,0 ANO_1,0 ANO_2,0 ANO_3, '+
         ' ARTID Articulo, ARTDES Descripcion, UNMIDG, UNMGDES U_Medida, UNMIDU, UNMUDES, '+
  			 'SUM(ENE) ENE, SUM(FEB) FEB, SUM(MAR) MAR, SUM(ABR) ABR, SUM(MAY) MAY, '+
         'SUM(JUN) JUN, SUM(JUL) JUL, SUM(AGO) AGO , SUM(SEPT) SEPT, SUM(OCT) OCT, SUM(NOV) NOV, SUM(DIC) DIC FROM '+
         '(SELECT ARTID,ARTDES,UNMIDG,UG.UNMDES UNMGDES,UNMIDU,UU.UNMDES UNMUDES, '+
         'CASE WHEN KDXMM=''01'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END ENE, '+
         'CASE WHEN KDXMM=''02'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END FEB, '+
         'CASE WHEN KDXMM=''03'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END MAR, '+
         'CASE WHEN KDXMM=''04'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END ABR, '+
         'CASE WHEN KDXMM=''05'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END MAY, '+
         'CASE WHEN KDXMM=''06'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END JUN, '+
         'CASE WHEN KDXMM=''07'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END JUL, '+
         'CASE WHEN KDXMM=''08'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END AGO, '+
         'CASE WHEN KDXMM=''09'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END SEPT, '+
         'CASE WHEN KDXMM=''10'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END OCT, '+
         'CASE WHEN KDXMM=''11'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END NOV, '+
         'CASE WHEN KDXMM=''12'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END DIC '+
         'FROM LOG315 ' +
         'LEFT JOIN TGE130 UU ON (LOG315.UNMIDU=UU.UNMID) '+
         'LEFT JOIN TGE130 UG ON (LOG315.UNMIDG=UG.UNMID) '+sWhere+
         'AND KDXANO='+quotedStr(IntToStr(seAno.Value))+
         'GROUP BY ARTID,ARTDES,UNMIDG,UG.UNMDES,UNMIDU,UU.UNMDES,KDXMM) X '+
         'GROUP BY ARTID,ARTDES,UNMIDG,UNMGDES,UNMIDU,UNMUDES ';
  end
  else
  if SRV_D = 'ORACLE' then
  begin
//  scad3:='SELECT 0 A'+IntToStr(Y)+',0 A'+IntToStr(Y-1)+',0 A'+IntToStr(Y-2)+',0 A'+IntToStr(Y-3)+', '+
  scad3:='SELECT 0 ANO_4,0 ANO_1,0 ANO_2,0 ANO_3, '+
         ' ARTID Articulo, ARTDES Descripcion, UNMIDG, UNMGDES U_Medida, UNMIDU, UNMUDES, '+
  		   ' SUM(ENE) ENE, SUM(FEB) FEB, SUM(MAR) MAR, SUM(ABR) ABR, SUM(MAY) MAY, '+
         'SUM(JUN) JUN, SUM(JUL) JUL, SUM(AGO) AGO, SUM(SEPT) SEPT, SUM(OCT) OCT, '+
         'SUM(NOV) NOV, SUM(DIC) DIC FROM '+
         '(SELECT ARTID,ARTDES,UNMIDG,UG.UNMDES UNMGDES,UNMIDU,UU.UNMDES UNMUDES, '+
         'CASE WHEN KDXMM=''01'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END ENE, '+
         'CASE WHEN KDXMM=''02'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END FEB, '+
         'CASE WHEN KDXMM=''03'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END MAR, '+
         'CASE WHEN KDXMM=''04'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END ABR, '+
         'CASE WHEN KDXMM=''05'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END MAY, '+
         'CASE WHEN KDXMM=''06'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END JUN, '+
         'CASE WHEN KDXMM=''07'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END JUL, '+
         'CASE WHEN KDXMM=''08'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END AGO, '+
         'CASE WHEN KDXMM=''09'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END SEPT, '+
         'CASE WHEN KDXMM=''10'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END OCT, '+
         'CASE WHEN KDXMM=''11'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END NOV, '+
         'CASE WHEN KDXMM=''12'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END DIC '+
         'FROM LOG315,TGE130 UU,TGE130 UG ' +
         'WHERE (LOG315.UNMIDU=UU.UNMID(+)) AND (LOG315.UNMIDG=UG.UNMID(+)) '+sWhere+
         'AND KDXANO='+quotedStr(IntToStr(seAno.Value))+
         'GROUP BY ARTID,ARTDES,UNMIDG,UG.UNMDES,UNMIDU,UU.UNMDES,KDXMM) X '+
         'GROUP BY ARTID,ARTDES,UNMIDG,UNMGDES,UNMIDU,UNMUDES ';
  end;
 end
 else //Anual
 begin
   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
   scad3:=' SELECT 0 ENE, 0 FEB, 0 MAR, 0 ABR, 0 MAY, 0 JUN, 0 JUL, 0 AGO, 0 SEPT, 0 OCT, 0 NOV, 0 DIC, '+
          ' ARTID Articulo, ARTDES Descripcion, UNMIDG, UNMGDES U_Medida, UNMIDU, UNMUDES, '+
//          ' SUM(A1) A'+IntToStr(Y)+', SUM(A2) A'+IntToStr(Y-1)+
 //         ', SUM(A3) A'+IntToStr(Y-2)+', SUM(A4) A'+IntToStr(Y-3)+' FROM '+
          ' SUM(A1) ANOACT, SUM(A2) ANO_1, SUM(A3) ANO_2, SUM(A4) ANO_3 FROM '+
          ' (SELECT ARTID,ARTDES,UNMIDG,UG.UNMDES UNMGDES,UNMIDU,UU.UNMDES UNMUDES, '+
          ' CASE WHEN KDXANO='+quotedStr(IntToStr(Y))+'   THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END A1, '+
          ' CASE WHEN KDXANO='+quotedStr(IntToStr(Y-1))+' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END A2, '+
          ' CASE WHEN KDXANO='+quotedStr(IntToStr(Y-2))+' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END A3, '+
          ' CASE WHEN KDXANO='+quotedStr(IntToStr(Y-3))+' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END A4 '+
          ' FROM LOG315 '+
          ' LEFT JOIN TGE130 UU ON (LOG315.UNMIDU=UU.UNMID) '+
          ' LEFT JOIN TGE130 UG ON (LOG315.UNMIDG=UG.UNMID) '+sWhere+
          ' AND KDXANO<='+quotedStr(IntToStr(Y))+' AND KDXANO>='+quotedStr(IntToStr(Y-3))+
          ' GROUP BY ARTID,ARTDES,UNMIDG,UG.UNMDES,UNMIDU,UU.UNMDES,KDXANO) X '+
          ' GROUP BY ARTID,ARTDES,UNMIDG,UNMGDES,UNMIDU,UNMUDES ';

  end
  else
  if SRV_D = 'ORACLE' then
  begin
   scad3:='SELECT 0 ENE, 0 FEB, 0 MAR, 0 ABR, 0 MAY, 0 JUN, 0 JUL, 0 AGO, 0 SEPT, 0 OCT, 0 NOV, 0 DIC, '+
          ' ARTID Articulo, ARTDES Descripcion, UNMIDG, UNMGDES U_Medida, UNMIDU, UNMUDES, '+
//          ' SUM(A1) A'+IntToStr(Y)+', SUM(A2) A'+IntToStr(Y-1)+
 //         ', SUM(A3) A'+IntToStr(Y-2)+', SUM(A4) A'+IntToStr(Y-3)+' FROM '+
          ' SUM(A1) ANO_4, SUM(A2) ANO_3, SUM(A3) ANO_2, SUM(A4) ANO_1 FROM '+
          '(SELECT ARTID,ARTDES,UNMIDG,UG.UNMDES UNMGDES,UNMIDU,UU.UNMDES UNMUDES, '+
          ' CASE WHEN KDXANO='+quotedStr(IntToStr(Y))+'   THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END A1, '+
          ' CASE WHEN KDXANO='+quotedStr(IntToStr(Y-1))+' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END A2, '+
          ' CASE WHEN KDXANO='+quotedStr(IntToStr(Y-2))+' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END A3, '+
          ' CASE WHEN KDXANO='+quotedStr(IntToStr(Y-3))+' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END A4 '+
          'FROM LOG315,TGE130 UU,TGE130 UG '+
          'WHERE (LOG315.UNMIDU=UU.UNMID(+)) AND (LOG315.UNMIDG=UG.UNMID(+)) '+sWhere+
          'AND KDXANO<='+quotedStr(IntToStr(Y))+' AND KDXANO>='+quotedStr(IntToStr(Y-3))+
          'GROUP BY ARTID,ARTDES,UNMIDG,UG.UNMDES,UNMIDU,UU.UNMDES,KDXANO) X '+
          'GROUP BY ARTID,ARTDES,UNMIDG,UNMGDES,UNMIDU,UNMUDES';
  end;
 end;
 }
   cFamdes :=dbeFam.Text;
   cSFamDes:=dbeSFam.Text;
   if dbeFam.Text=''  then cFamdes :='TODAS';
   if dbeSFam.Text='' then cSFamdes:='TODAS';

   xSQL:='Select STKANO, A.CIAID, C.CIADES, A.LOCID, A.TINID, ALMID, A.GRARID, A.FAMID, A.SFAMID, A.ARTID, A.UNMIDG, '
        +  'L.MARCA, M.MARDES, L.TIPART, T.TIPARTDES, L.MODELO, L.PROV, P.PROVDES, L.CARART, '
        +  'I.TINDES, G.GRARDES, F.FAMDES, S.SFAMDES, L.ARTDES, '
        +  ''''+cFamdes+''' TITFAM, '''+cSFamdes+''' TITSFAM, '

        +  'SUM(NVL(STKSANTG,0)) ANT_SS, SUM(NVL(STKMANTG,0)) ANT_SM, '

        +  'SUM(NVL(STKTSG01,0)) ENE_SS, SUM(NVL(STKISG01,0)) ENE_IS, SUM(NVL(STKSSG01,0)) ENE_ES, '
        +  'SUM(NVL(STKTSG02,0)) FEB_SS, SUM(NVL(STKISG02,0)) FEB_IS, SUM(NVL(STKSSG02,0)) FEB_ES, '
        +  'SUM(NVL(STKTSG03,0)) MAR_SS, SUM(NVL(STKISG03,0)) MAR_IS, SUM(NVL(STKSSG03,0)) MAR_ES, '
        +  'SUM(NVL(STKTSG04,0)) ABR_SS, SUM(NVL(STKISG04,0)) ABR_IS, SUM(NVL(STKSSG04,0)) ABR_ES, '
        +  'SUM(NVL(STKTSG05,0)) MAY_SS, SUM(NVL(STKISG05,0)) MAY_IS, SUM(NVL(STKSSG05,0)) MAY_ES, '
        +  'SUM(NVL(STKTSG06,0)) JUN_SS, SUM(NVL(STKISG06,0)) JUN_IS, SUM(NVL(STKSSG06,0)) JUN_ES, '
        +  'SUM(NVL(STKTSG07,0)) JUL_SS, SUM(NVL(STKISG07,0)) JUL_IS, SUM(NVL(STKSSG07,0)) JUL_ES, '
        +  'SUM(NVL(STKTSG08,0)) AGO_SS, SUM(NVL(STKISG08,0)) AGO_IS, SUM(NVL(STKSSG08,0)) AGO_ES, '
        +  'SUM(NVL(STKTSG09,0)) SET_SS, SUM(NVL(STKISG09,0)) SET_IS, SUM(NVL(STKSSG09,0)) SET_ES, '
        +  'SUM(NVL(STKTSG10,0)) OCT_SS, SUM(NVL(STKISG10,0)) OCT_IS, SUM(NVL(STKSSG10,0)) OCT_ES, '
        +  'SUM(NVL(STKTSG11,0)) NOV_SS, SUM(NVL(STKISG11,0)) NOV_IS, SUM(NVL(STKSSG11,0)) NOV_ES, '
        +  'SUM(NVL(STKTSG12,0)) DIC_SS, SUM(NVL(STKISG12,0)) DIC_IS, SUM(NVL(STKSSG12,0)) DIC_ES, '
        +  'SUM(NVL(STKSACTG,0)) ACT_SS, '

        +  'SUM(NVL(STKTSG01*ARTPCG,0)) ENE_SM, SUM(NVL(STKISG01*ARTPCG,0)) ENE_IM, SUM(NVL(STKSSG01*ARTPCG,0)) ENE_EM, '
        +  'SUM(NVL(STKTSG02*ARTPCG,0)) FEB_SM, SUM(NVL(STKISG02*ARTPCG,0)) FEB_IM, SUM(NVL(STKSSG02*ARTPCG,0)) FEB_EM, '
        +  'SUM(NVL(STKTSG03*ARTPCG,0)) MAR_SM, SUM(NVL(STKISG03*ARTPCG,0)) MAR_IM, SUM(NVL(STKSSG03*ARTPCG,0)) MAR_EM, '
        +  'SUM(NVL(STKTSG04*ARTPCG,0)) ABR_SM, SUM(NVL(STKISG04*ARTPCG,0)) ABR_IM, SUM(NVL(STKSSG04*ARTPCG,0)) ABR_EM, '
        +  'SUM(NVL(STKTSG05*ARTPCG,0)) MAY_SM, SUM(NVL(STKISG05*ARTPCG,0)) MAY_IM, SUM(NVL(STKSSG05*ARTPCG,0)) MAY_EM, '
        +  'SUM(NVL(STKTSG06*ARTPCG,0)) JUN_SM, SUM(NVL(STKISG06*ARTPCG,0)) JUN_IM, SUM(NVL(STKSSG06*ARTPCG,0)) JUN_EM, '
        +  'SUM(NVL(STKTSG07*ARTPCG,0)) JUL_SM, SUM(NVL(STKISG07*ARTPCG,0)) JUL_IM, SUM(NVL(STKSSG07*ARTPCG,0)) JUL_EM, '
        +  'SUM(NVL(STKTSG08*ARTPCG,0)) AGO_SM, SUM(NVL(STKISG08*ARTPCG,0)) AGO_IM, SUM(NVL(STKSSG08*ARTPCG,0)) AGO_EM, '
        +  'SUM(NVL(STKTSG09*ARTPCG,0)) SET_SM, SUM(NVL(STKISG09*ARTPCG,0)) SET_IM, SUM(NVL(STKSSG09*ARTPCG,0)) SET_EM, '
        +  'SUM(NVL(STKTSG10*ARTPCG,0)) OCT_SM, SUM(NVL(STKISG10*ARTPCG,0)) OCT_IM, SUM(NVL(STKSSG10*ARTPCG,0)) OCT_EM, '
        +  'SUM(NVL(STKTSG11*ARTPCG,0)) NOV_SM, SUM(NVL(STKISG11*ARTPCG,0)) NOV_IM, SUM(NVL(STKSSG11*ARTPCG,0)) NOV_EM, '
        +  'SUM(NVL(STKTSG12*ARTPCG,0)) DIC_SM, SUM(NVL(STKISG12*ARTPCG,0)) DIC_IM, SUM(NVL(STKSSG12*ARTPCG,0)) DIC_EM, '
        +  'SUM(NVL(STKSACTG*ARTPCG,0)) ACT_SM '
        {
        +  'SUM(NVL(STKTMG01,0)) ENE_SM, SUM(NVL(STKIMG01,0)) ENE_IM, SUM(NVL(STKSMG01,0)) ENE_EM, '
        +  'SUM(NVL(STKTMG02,0)) FEB_SM, SUM(NVL(STKIMG02,0)) FEB_IM, SUM(NVL(STKSMG02,0)) FEB_EM, '
        +  'SUM(NVL(STKTMG03,0)) MAR_SM, SUM(NVL(STKIMG03,0)) MAR_IM, SUM(NVL(STKSMG03,0)) MAR_EM, '
        +  'SUM(NVL(STKTMG04,0)) ABR_SM, SUM(NVL(STKIMG04,0)) ABR_IM, SUM(NVL(STKSMG04,0)) ABR_EM, '
        +  'SUM(NVL(STKTMG05,0)) MAY_SM, SUM(NVL(STKIMG05,0)) MAY_IM, SUM(NVL(STKSMG05,0)) MAY_EM, '
        +  'SUM(NVL(STKTMG06,0)) JUN_SM, SUM(NVL(STKIMG06,0)) JUN_IM, SUM(NVL(STKSMG06,0)) JUN_EM, '
        +  'SUM(NVL(STKTMG07,0)) JUL_SM, SUM(NVL(STKIMG07,0)) JUL_IM, SUM(NVL(STKSMG07,0)) JUL_EM, '
        +  'SUM(NVL(STKTMG08,0)) AGO_SM, SUM(NVL(STKIMG08,0)) AGO_IM, SUM(NVL(STKSMG08,0)) AGO_EM, '
        +  'SUM(NVL(STKTMG09,0)) SET_SM, SUM(NVL(STKIMG09,0)) SET_IM, SUM(NVL(STKSMG09,0)) SET_EM, '
        +  'SUM(NVL(STKTMG10,0)) OCT_SM, SUM(NVL(STKIMG10,0)) OCT_IM, SUM(NVL(STKSMG10,0)) OCT_EM, '
        +  'SUM(NVL(STKTMG11,0)) NOV_SM, SUM(NVL(STKIMG11,0)) NOV_IM, SUM(NVL(STKSMG11,0)) NOV_EM, '
        +  'SUM(NVL(STKTMG12,0)) DIC_SM, SUM(NVL(STKIMG12,0)) DIC_IM, SUM(NVL(STKSMG12,0)) DIC_EM, '
        +  'SUM(NVL(STKMACTG,0)) ACT_SM '
        }
        +'from LOG316 A, TGE205 L, ALM_MAR_ART M, ALM_TIP_ART T, TGE201 P, TGE101 C, '
        +     'TGE152 I, TGE131 G, TGE169 F, TGE170 S '
        +'WHERE A.CIAID='+quotedStr(dblcCia.text)
        + ' AND A.STKANO='''+seAno.Text+''' '
        + ' AND A.TINID  LIKE '''+dblcTipInv.Text +'%'' '
        + ' AND A.ALMID  LIKE '''+dblcAlmacen.Text+'%'' '

        + ' AND A.GRARID LIKE '''+dblcGrpArti.text+'%'' '
        + ' AND A.FAMID  LIKE '''+dblcFAM.text    +'%'' '
        + ' AND A.SFAMID LIKE '''+dblcSubFAM.Text +'%'' '

        + ' AND A.CIAID=I.CIAID AND A.TINID=I.TINID(+) '
        + ' AND A.CIAID=G.CIAID AND A.TINID=G.TINID(+) AND A.GRARID=G.GRARID(+) '
        + ' AND A.CIAID=F.CIAID AND A.TINID=F.TINID(+) AND A.GRARID=F.GRARID(+) AND A.FAMID=F.FAMID(+) '
        + ' AND A.CIAID=S.CIAID AND A.TINID=S.TINID(+) AND A.GRARID=S.GRARID(+) AND A.FAMID=S.FAMID(+) '
        + ' AND A.SFAMID=S.SFAMID(+) '

        + ' AND A.CIAID=L.CIAID(+) AND A.TINID=L.TINID(+) AND A.ARTID=L.ARTID(+) '

        + ' AND L.MARCA=M.MARCA(+) ';

   if dblcdMarca.Text='' then
      xSQL:=xSQL+'' //and L.MARCA(+) LIKE '''+dblcdMarca.Text+'%'' '
   else
      xSQL:=xSQL+'and L.MARCA LIKE '''+dblcdMarca.Text+'%'' ';

   xSQL:=xSQL
        +  'AND (L.TIPART=T.TIPART(+)) ';

   if dblcdArtTipo.Text='' then
      xSQL:=xSQL+'' //and L.TIPART(+) LIKE '''+dblcdArtTipo.Text+'%'' '
   else
      xSQL:=xSQL+'and L.TIPART LIKE '''+dblcdArtTipo.Text+'%'' ';

   xSQL:=xSQL
        +  'AND (P.CLAUXID(+)=''P'' AND L.PROV=P.PROV(+)) ';

   if dblcdProv.Text='' then
      xSQL:=xSQL+'and P.PROV(+) LIKE '''+dblcdProv.Text+'%'' '
   else
      xSQL:=xSQL+'and P.PROV LIKE '''+dblcdProv.Text+'%'' ';

   xSQL:=xSQL
        + ' AND A.CIAID=C.CIAID(+) '
        +'GROUP BY STKANO, A.CIAID, C.CIADES, A.LOCID, A.TINID, ALMID, A.GRARID, A.FAMID, A.SFAMID, '
        +  'A.ARTID, A.UNMIDG, L.MARCA, M.MARDES, L.TIPART, T.TIPARTDES, L.MODELO, L.PROV, P.PROVDES, '
        +  'L.CARART, I.TINDES, G.GRARDES, F.FAMDES, S.SFAMDES, L.ARTDES '
        +'ORDER BY L.PROV, ARTID ';

  xSQL := 'select * from ('+xSQL+') SOLVISTA ';

{
  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   sWhere:=' WHERE NISATIP=''SALIDA'' AND LOG315.CIAID='+quotedStr(dblcCia.text)+' AND LOG315.TINID='+quotedStr(dblcTipInv.text)
  else
   if SRV_D = 'ORACLE' then
     sWhere:=' AND NISATIP=''SALIDA'' AND LOG315.CIAID='+quotedStr(dblcCia.text)+' AND LOG315.TINID='+quotedStr(dblcTipInv.text);

 if dblcLocalidad.text<>'' then
    sWhere:=sWhere+' AND LOG315.LOCID='+quotedStr(dblcLocalidad.text);

 if dblcGrpArti.text<>'' then
    sWhere:=sWhere+' AND LOG315.GRARID='+quotedStr(dblcGrpArti.text);
}
 {
 mtx5000.NoVisible.Clear;
 if rgPeriodo.ItemIndex=0 then
 begin
    mtx5000.NoVisible.Add('ENE');
    mtx5000.NoVisible.Add('FEB');
    mtx5000.NoVisible.Add('MAR');
    mtx5000.NoVisible.Add('ABR');
    mtx5000.NoVisible.Add('MAY');
    mtx5000.NoVisible.Add('JUN');
    mtx5000.NoVisible.Add('JUL');
    mtx5000.NoVisible.Add('AGO');
    mtx5000.NoVisible.Add('SEPT');
    mtx5000.NoVisible.Add('OCT');
    mtx5000.NoVisible.Add('NOV');
    mtx5000.NoVisible.Add('DIC');
    mtx5000.NoVisible.Add('UNMIDG');
    mtx5000.NoVisible.Add('UNMIDU');
    mtx5000.NoVisible.Add('UNMUDES');
 end
 else
 begin
//    mtx5000.NoVisible.Add('A'+IntToStr(Y));
//    mtx5000.NoVisible.Add('A'+IntToStr(Y-1));
//    mtx5000.NoVisible.Add('A'+IntToStr(Y-2));
//    mtx5000.NoVisible.Add('A'+IntToStr(Y-3));
    mtx5000.NoVisible.Add('ANO_4');
    mtx5000.NoVisible.Add('ANO_1');
    mtx5000.NoVisible.Add('ANO_2');
    mtx5000.NoVisible.Add('ANO_3');
    mtx5000.NoVisible.Add('UNMIDG');
    mtx5000.NoVisible.Add('UNMIDU');
    mtx5000.NoVisible.Add('UNMUDES');
 end;
 }

 Mtx5000.NoVisible.Clear;
 if rgTipo.ItemIndex=1 then
 begin
    mtx5000.NoVisible.Add('ANT_SS');

    mtx5000.NoVisible.Add('ENE_SS');
    mtx5000.NoVisible.Add('FEB_SS');
    mtx5000.NoVisible.Add('MAR_SS');
    mtx5000.NoVisible.Add('ABR_SS');
    mtx5000.NoVisible.Add('MAY_SS');
    mtx5000.NoVisible.Add('JUN_SS');
    mtx5000.NoVisible.Add('JUL_SS');
    mtx5000.NoVisible.Add('AGO_SS');
    mtx5000.NoVisible.Add('SET_SS');
    mtx5000.NoVisible.Add('OCT_SS');
    mtx5000.NoVisible.Add('NOV_SS');
    mtx5000.NoVisible.Add('DIC_SS');

    mtx5000.NoVisible.Add('ENE_IS');
    mtx5000.NoVisible.Add('FEB_IS');
    mtx5000.NoVisible.Add('MAR_IS');
    mtx5000.NoVisible.Add('ABR_IS');
    mtx5000.NoVisible.Add('MAY_IS');
    mtx5000.NoVisible.Add('JUN_IS');
    mtx5000.NoVisible.Add('JUL_IS');
    mtx5000.NoVisible.Add('AGO_IS');
    mtx5000.NoVisible.Add('SET_IS');
    mtx5000.NoVisible.Add('OCT_IS');
    mtx5000.NoVisible.Add('NOV_IS');
    mtx5000.NoVisible.Add('DIC_IS');

    mtx5000.NoVisible.Add('ENE_ES');
    mtx5000.NoVisible.Add('FEB_ES');
    mtx5000.NoVisible.Add('MAR_ES');
    mtx5000.NoVisible.Add('ABR_ES');
    mtx5000.NoVisible.Add('MAY_ES');
    mtx5000.NoVisible.Add('JUN_ES');
    mtx5000.NoVisible.Add('JUL_ES');
    mtx5000.NoVisible.Add('AGO_ES');
    mtx5000.NoVisible.Add('SET_ES');
    mtx5000.NoVisible.Add('OCT_ES');
    mtx5000.NoVisible.Add('NOV_ES');
    mtx5000.NoVisible.Add('DIC_ES');
 end
 else
 begin
    mtx5000.NoVisible.Add('ANT_SM');

    mtx5000.NoVisible.Add('ENE_SM');
    mtx5000.NoVisible.Add('FEB_SM');
    mtx5000.NoVisible.Add('MAR_SM');
    mtx5000.NoVisible.Add('ABR_SM');
    mtx5000.NoVisible.Add('MAY_SM');
    mtx5000.NoVisible.Add('JUN_SM');
    mtx5000.NoVisible.Add('JUL_SM');
    mtx5000.NoVisible.Add('AGO_SM');
    mtx5000.NoVisible.Add('SET_SM');
    mtx5000.NoVisible.Add('OCT_SM');
    mtx5000.NoVisible.Add('NOV_SM');
    mtx5000.NoVisible.Add('DIC_SM');

    mtx5000.NoVisible.Add('ENE_IM');
    mtx5000.NoVisible.Add('FEB_IM');
    mtx5000.NoVisible.Add('MAR_IM');
    mtx5000.NoVisible.Add('ABR_IM');
    mtx5000.NoVisible.Add('MAY_IM');
    mtx5000.NoVisible.Add('JUN_IM');
    mtx5000.NoVisible.Add('JUL_IM');
    mtx5000.NoVisible.Add('AGO_IM');
    mtx5000.NoVisible.Add('SET_IM');
    mtx5000.NoVisible.Add('OCT_IM');
    mtx5000.NoVisible.Add('NOV_IM');
    mtx5000.NoVisible.Add('DIC_IM');

    mtx5000.NoVisible.Add('ENE_EM');
    mtx5000.NoVisible.Add('FEB_EM');
    mtx5000.NoVisible.Add('MAR_EM');
    mtx5000.NoVisible.Add('ABR_EM');
    mtx5000.NoVisible.Add('MAY_EM');
    mtx5000.NoVisible.Add('JUN_EM');
    mtx5000.NoVisible.Add('JUL_EM');
    mtx5000.NoVisible.Add('AGO_EM');
    mtx5000.NoVisible.Add('SET_EM');
    mtx5000.NoVisible.Add('OCT_EM');
    mtx5000.NoVisible.Add('NOV_EM');
    mtx5000.NoVisible.Add('DIC_EM');
 end;

 mtx5000.UsuarioSQL.Clear;
 mtx5000.UsuarioSQL.Add( xSQL );
 mtx5000.NewQuery;

 mtx5000.RefreshDisplay;

end;

procedure TFToolConAnno.dblcCiaExit(Sender: TObject);
begin
   edtCIA.text:=DMLOG.DisplayDescrip('prvSQL','TGE101','CIADES','CIAID='+quotedStr(dblcCIA.text),'CIADES');

   DMLOG.cdsLOC.Filtered := False;
   DMLOG.cdsLOC.Filter   := 'CIAID='''+dblcCIA.Text+'''';
   DMLOG.cdsLOC.Filtered := True;

   DMLOG.cdsTINID.Filtered := False;
   DMLOG.cdsTINID.Filter   := 'CIAID='''+dblcCIA.Text+'''';
   DMLOG.cdsTINID.Filtered := True;
end;

procedure TFToolConAnno.dblcTipInvExit(Sender: TObject);
begin

   edtTinv.Text := DMLOG.cdsTINID.FieldByName('TINDES').AsString;

   DMLOG.cdsALM.Filtered := False;
   DMLOG.cdsALM.Filter   := 'CIAID='''+dblcCIA.Text+''' AND TINID='+quotedStr(dblcTipInv.Text);
   DMLOG.cdsALM.Filtered := True;

   DMLOG.cdsGArti.Filtered:=False;
   DMLOG.cdsGArti.Filter  :='CIAID='+quotedStr(dblcCIA.Text)+' AND TINID='+quotedStr(dblcTipInv.Text);
   DMLOG.cdsGArti.Filtered:=True;
end;

procedure TFToolConAnno.dblcNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
	if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;

	Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFToolConAnno.FormShow(Sender: TObject);
begin
  dblcCia.SetFocus;
end;

procedure TFToolConAnno.Timer1Timer(Sender: TObject);
begin
   //FVariables.w_NombreForma := 'FToolConAnno';
   if (DMLOG.wAdmin='G') or (DMLOG.wAdmin='P') then Exit;
   if not xAccesoBotones then
   begin
      DMLOG.AccesosUsuariosR( DMLOG.wModulo,DMLOG.wUsuario,'2',FToolConAnno);
      xAccesoBotones := True;
   end;
   Timer1.Destroy;
end;

{
SELECT ARTID,ARTDES,UNMIDG,UG.UNMDES UNMGDES,UNMIDU,UU.UNMDES UNMUDES,
  SUM( CASE WHEN KDXMM='01' AND NISATIP='SALIDA'  THEN KDXCNTG*ARTCONT+KDXCNTU ELSE 0 END ) ENE_S,
  SUM( CASE WHEN KDXMM='02' AND NISATIP='SALIDA'  THEN KDXCNTG*ARTCONT+KDXCNTU ELSE 0 END ) FEB_S,
  SUM( CASE WHEN KDXMM='03' AND NISATIP='SALIDA'  THEN KDXCNTG*ARTCONT+KDXCNTU ELSE 0 END ) MAR_S,
  SUM( CASE WHEN KDXMM='04' AND NISATIP='SALIDA'  THEN KDXCNTG*ARTCONT+KDXCNTU ELSE 0 END ) ABR_S,
  SUM( CASE WHEN KDXMM='05' AND NISATIP='SALIDA'  THEN KDXCNTG*ARTCONT+KDXCNTU ELSE 0 END ) MAY_S,
  SUM( CASE WHEN KDXMM='06' AND NISATIP='SALIDA'  THEN KDXCNTG*ARTCONT+KDXCNTU ELSE 0 END ) JUN_S,
  SUM( CASE WHEN KDXMM='07' AND NISATIP='SALIDA'  THEN KDXCNTG*ARTCONT+KDXCNTU ELSE 0 END ) JUL_S,
  SUM( CASE WHEN KDXMM='08' AND NISATIP='SALIDA'  THEN KDXCNTG*ARTCONT+KDXCNTU ELSE 0 END ) AGO_S,
  SUM( CASE WHEN KDXMM='09' AND NISATIP='SALIDA'  THEN KDXCNTG*ARTCONT+KDXCNTU ELSE 0 END ) SET_S,
  SUM( CASE WHEN KDXMM='10' AND NISATIP='SALIDA'  THEN KDXCNTG*ARTCONT+KDXCNTU ELSE 0 END ) OCT_S,
  SUM( CASE WHEN KDXMM='11' AND NISATIP='SALIDA'  THEN KDXCNTG*ARTCONT+KDXCNTU ELSE 0 END ) NOV_S,
  SUM( CASE WHEN KDXMM='12' AND NISATIP='SALIDA'  THEN KDXCNTG*ARTCONT+KDXCNTU ELSE 0 END ) DIC_S,
  SUM( CASE WHEN KDXMM='01' AND NISATIP='INGRESO' THEN KDXCNTG*ARTCONT+KDXCNTU ELSE 0 END ) ENE_I,
  SUM( CASE WHEN KDXMM='02' AND NISATIP='INGRESO' THEN KDXCNTG*ARTCONT+KDXCNTU ELSE 0 END ) FEB_I,
  SUM( CASE WHEN KDXMM='03' AND NISATIP='INGRESO' THEN KDXCNTG*ARTCONT+KDXCNTU ELSE 0 END ) MAR_I,
  SUM( CASE WHEN KDXMM='04' AND NISATIP='INGRESO' THEN KDXCNTG*ARTCONT+KDXCNTU ELSE 0 END ) ABR_I,
  SUM( CASE WHEN KDXMM='05' AND NISATIP='INGRESO' THEN KDXCNTG*ARTCONT+KDXCNTU ELSE 0 END ) MAY_I,
  SUM( CASE WHEN KDXMM='06' AND NISATIP='INGRESO' THEN KDXCNTG*ARTCONT+KDXCNTU ELSE 0 END ) JUN_I,
  SUM( CASE WHEN KDXMM='07' AND NISATIP='INGRESO' THEN KDXCNTG*ARTCONT+KDXCNTU ELSE 0 END ) JUL_I,
  SUM( CASE WHEN KDXMM='08' AND NISATIP='INGRESO' THEN KDXCNTG*ARTCONT+KDXCNTU ELSE 0 END ) AGO_I,
  SUM( CASE WHEN KDXMM='09' AND NISATIP='INGRESO' THEN KDXCNTG*ARTCONT+KDXCNTU ELSE 0 END ) SET_I,
  SUM( CASE WHEN KDXMM='10' AND NISATIP='INGRESO' THEN KDXCNTG*ARTCONT+KDXCNTU ELSE 0 END ) OCT_I,
  SUM( CASE WHEN KDXMM='11' AND NISATIP='INGRESO' THEN KDXCNTG*ARTCONT+KDXCNTU ELSE 0 END ) NOV_I,
  SUM( CASE WHEN KDXMM='12' AND NISATIP='INGRESO' THEN KDXCNTG*ARTCONT+KDXCNTU ELSE 0 END ) DIC_I
FROM LOG315,TGE130 UU,TGE130 UG
WHERE (LOG315.UNMIDU=UU.UNMID(+)) AND (LOG315.UNMIDG=UG.UNMID(+))  AND LOG315.CIAID='04'
 AND LOG315.TINID='20' AND LOG315.LOCID='01' AND LOG315.GRARID='01'AND KDXANO='2005'
 GROUP BY ARTID,ARTDES,UNMIDG,UG.UNMDES,UNMIDU,UU.UNMDES,KDXMM


select STKANO, A.CIAID, A.LOCID, A.TINID, ALMID, A.GRARID, A.FAMID, A.SFAMID, A.ARTID, A.UNMIDG,
 L.MARCA, M.MARDES, L.TIPART, T.TIPARTDES, L.MODELO, L.PROV, P.PROVDES, L.CARART,
 SUM(NVL(STKSANTG,0)) ANT_SS, SUM(NVL(STKMANTG,0)) ANT_SM
 SUM(NVL(STKTSG01,0)) ENE_SS, SUM(NVL(STKISG01,0)) ENE_IS, SUM(NVL(STKSSG01,0)) ENE_ES, SUM(NVL(STKTMG01,0)) ENE_SM, SUM(NVL(STKIMG01,0)) ENE_IM, SUM(NVL(STKSMG01,0)) ENE_EM,
 SUM(NVL(STKTSG02,0)) FEB_SS, SUM(NVL(STKISG02,0)) FEB_IS, SUM(NVL(STKSSG02,0)) FEB_ES, SUM(NVL(STKTMG02,0)) FEB_SM, SUM(NVL(STKIMG02,0)) FEB_IM, SUM(NVL(STKSMG02,0)) FEB_EM,
 SUM(NVL(STKTSG03,0)) MAR_SS, SUM(NVL(STKISG03,0)) MAR_IS, SUM(NVL(STKSSG03,0)) MAR_ES, SUM(NVL(STKTMG03,0)) MAR_SM, SUM(NVL(STKIMG03,0)) MAR_IM, SUM(NVL(STKSMG03,0)) MAR_EM,
 SUM(NVL(STKTSG04,0)) ABR_SS, SUM(NVL(STKISG04,0)) ABR_IS, SUM(NVL(STKSSG04,0)) ABR_ES, SUM(NVL(STKTMG04,0)) ABR_SM, SUM(NVL(STKIMG04,0)) ABR_IM, SUM(NVL(STKSMG04,0)) ABR_EM,
 SUM(NVL(STKTSG05,0)) MAY_SS, SUM(NVL(STKISG05,0)) MAY_IS, SUM(NVL(STKSSG05,0)) MAY_ES, SUM(NVL(STKTMG05,0)) MAY_SM, SUM(NVL(STKIMG05,0)) MAY_IM, SUM(NVL(STKSMG05,0)) MAY_EM,
 SUM(NVL(STKTSG06,0)) JUN_SS, SUM(NVL(STKISG06,0)) JUN_IS, SUM(NVL(STKSSG06,0)) JUN_ES, SUM(NVL(STKTMG06,0)) JUN_SM, SUM(NVL(STKIMG06,0)) JUN_IM, SUM(NVL(STKSMG06,0)) JUN_EM,
 SUM(NVL(STKTSG07,0)) JUL_SS, SUM(NVL(STKISG07,0)) JUL_IS, SUM(NVL(STKSSG07,0)) JUL_ES, SUM(NVL(STKTMG07,0)) JUL_SM, SUM(NVL(STKIMG07,0)) JUL_IM, SUM(NVL(STKSMG07,0)) JUL_EM,
 SUM(NVL(STKTSG08,0)) AGO_SS, SUM(NVL(STKISG08,0)) AGO_IS, SUM(NVL(STKSSG08,0)) AGO_ES, SUM(NVL(STKTMG08,0)) AGO_SM, SUM(NVL(STKIMG08,0)) AGO_IM, SUM(NVL(STKSMG08,0)) AGO_EM,
 SUM(NVL(STKTSG09,0)) SET_SS, SUM(NVL(STKISG09,0)) SET_IS, SUM(NVL(STKSSG09,0)) SET_ES, SUM(NVL(STKTMG09,0)) SET_SM, SUM(NVL(STKIMG09,0)) SET_IM, SUM(NVL(STKSMG09,0)) SET_EM,
 SUM(NVL(STKTSG10,0)) OCT_SS, SUM(NVL(STKISG10,0)) OCT_IS, SUM(NVL(STKSSG10,0)) OCT_ES, SUM(NVL(STKTMG10,0)) OCT_SM, SUM(NVL(STKIMG10,0)) OCT_IM, SUM(NVL(STKSMG10,0)) OCT_EM,
 SUM(NVL(STKTSG11,0)) NOV_SS, SUM(NVL(STKISG11,0)) NOV_IS, SUM(NVL(STKSSG11,0)) NOV_ES, SUM(NVL(STKTMG11,0)) NOV_SM, SUM(NVL(STKIMG11,0)) NOV_IM, SUM(NVL(STKSMG11,0)) NOV_EM,
 SUM(NVL(STKTSG12,0)) DIC_SS, SUM(NVL(STKISG12,0)) DIC_IS, SUM(NVL(STKSSG12,0)) DIC_ES, SUM(NVL(STKTMG12,0)) DIC_SM, SUM(NVL(STKIMG12,0)) DIC_IM, SUM(NVL(STKSMG12,0)) DIC_EM,
 SUM(NVL(STKSACTG,0)) ACT_SS, SUM(NVL(STKMACTG,0)) ACT_SM
from LOG316 A, TGE205 L, ALM_MAR_ART M, ALM_TIP_ART T, TGE201 P
WHERE A.CIAID='04' AND A.STKANO='2005' AND A.GRARID='01'
  AND A.CIAID=L.CIAID(+) AND A.ARTID=L.ARTID(+)
  AND L.MARCA=M.MARCA(+)
  AND L.TIPART=T.TIPART(+)
  AND P.CLAUXID(+)='P' AND L.PROV=P.PROV(+)
GROUP BY STKANO, A.CIAID, A.LOCID, A.TINID, ALMID, A.GRARID, A.FAMID, A.SFAMID, A.ARTID, A.UNMIDG,
  L.MARCA, M.MARDES, L.TIPART, T.TIPARTDES, L.MODELO, L.PROV, P.PROVDES, L.CARART
ORDER BY ARTID

}
procedure TFToolConAnno.dblcLocalidadExit(Sender: TObject);
begin
{
  edtLoc.text:=DMLOG.DisplayDescrip('prvSQL','TGE101','CIADES','CIAID='+quotedStr(dblcCIA.text),'CIADES');
  }
end;


procedure TFToolConAnno.dblcdProvExit(Sender: TObject);
begin
  dbeProv.text:=DMLOG.DisplayDescrip('prvSQL','TGE201','CLAUXID,PROVDES', 'PROV='+quotedstr(dblcdProv.text),'PROVDES');
end;

procedure TFToolConAnno.dblcdMarcaExit(Sender: TObject);
begin
  edtMarca.text :=DMLOG.DisplayDescrip('prvSQL','ALM_MAR_ART','MARDES', 'MARCA='+quotedstr(dblcdMarca.text),'MARDES');
end;

procedure TFToolConAnno.dblcdArtTipoExit(Sender: TObject);
begin
  edtTipArt.text:=DMLOG.DisplayDescrip('prvSQL','ALM_TIP_ART','TIPARTDES', 'TIPART='+quotedstr(dblcdArtTipo.text),'TIPARTDES');
end;

procedure TFToolConAnno.FormCreate(Sender: TObject);
begin
  // vhndema
  xSQL:='SELECT CLAUXID, A.PROV, PROVDES '
       +'FROM TGE201 A, (SELECT PROV FROM TGE205 GROUP BY PROV ) B '
       +'WHERE CLAUXID=''P'' AND A.PROV=B.PROV '
       +'ORDER BY PROVDES';
  DMLOG.cdsQry10.Close;
  DMLOG.cdsQry10.DataRequest( xSQL );
  DMLOG.cdsQry10.Open;
  DMLOG.cdsQry10.IndexFieldNames:='PROVDES';

   // MARCA DE ARTICULO
  xSQL:='SELECT * FROM ALM_MAR_ART ORDER BY MARDES';
  DMLOG.cdsQry11.Close;
  DMLOG.cdsQry11.DataRequest( xSQL );
  DMLOG.cdsQry11.Open;
  DMLOG.cdsQry11.IndexFieldNames:='MARDES';

   // TIPO DE ARTICULO
  xSQL:='SELECT * FROM ALM_TIP_ART ORDER BY TIPARTDES';
  DMLOG.cdsQry12.Close;
  DMLOG.cdsQry12.DataRequest( xSQL );
  DMLOG.cdsQry12.Open;
  DMLOG.cdsQry12.IndexFieldNames:='TIPARTDES';

  // end vhndema

  dblcCia.LookupTable     := DMLOG.cdsCia;
  dblcTipInv.LookupTable    := DMLOG.cdsTINID;
  dblcAlmacen.LookupTable := DMLOG.cdsAlm;
  dblcdProv.LookupTable   := DMLOG.cdsQry10;
  dblcdMarca.LookupTable  := DMLOG.cdsQry11;
  dblcdArtTipo.LookupTable:= DMLOG.cdsQry12;
end;

procedure TFToolConAnno.dblcGrpArtiExit(Sender: TObject);
var
  sSQL : String;
begin
	sSQL := 'SELECT * FROM TGE169 WHERE TGE169.TINID='+quotedstr(dblcTipInv.text)+
        ' AND TGE169.GRARID='+QuotedStr(dblcGrpArti.text)+
        ' AND TGE169.CIAID='+QuotedStr(dblcCIA.text)+
        ' ORDER BY FAMID';
  DMLOG.cdsFAM.Close;
  DMLOG.cdsFAM.DataRequest(sSQL);
  DMLOG.cdsFAM.Open;
  if dblcGrpArti.Text <> '' then
  begin
  	sSQL:='GRARID='+quotedstr(dblcGrpArti.text)+' AND TINID ='''+dblcTipInv.text+'''';
  	dbeGrpArti.text:= DMLOG.DisplayDescrip('prvTGE','TGE131','GRARDES',sSQL,'GRARDES');
  end;
end;

procedure TFToolConAnno.dblcFAMExit(Sender: TObject);
var
	sSQL : String;
begin
  sSQL := 'SELECT * FROM TGE170 WHERE '+
          ' GRARID='+QuotedStr(dblcGrpArti.text)+
          ' AND TINID='+QuotedStr(dblcTipInv.text)+
          ' AND FAMID='+QuotedStr(dblcFAM.text)+
          ' AND CIAID='+QuotedStr(dblcCIA.text)+
          ' ORDER BY SFAMID';
  DMLOG.cdsSUBFAM.Close;
  DMLOG.cdsSUBFAM.DataRequest(sSQL);
  DMLOG.cdsSUBFAM.Open;

  sSQL:='GRARID='+quotedstr(dblcGrpArti.text)+' AND TINID ='''+dblcTipInv.text+''' AND FAMID='+quotedstr(dblcFAM.text);
  dbeFAM.text := DMLOG.DisplayDescrip('prvTGE','TGE169','FAMDES, ARTUSU',sSQL,'FAMDES');
end;

procedure TFToolConAnno.dblcSubFAMExit(Sender: TObject);
var
  sSQL : String;
begin
  sSQL:='GRARID='+quotedstr(dblcGrpArti.text)+' AND TINID ='''+dblcTipInv.text+''' AND FAMID='+quotedstr(dblcFAM.text)+' AND SFAMID='+quotedstr(dblcSUBFAM.text);
  dbeSFAM.text   := DMLOG.DisplayDescrip('prvTGE','TGE170','SFAMDES',sSQL,'SFAMDES');
end;

procedure TFToolConAnno.bbtnEneJunClick(Sender: TObject);
var
   xSQL : String;
   x10  : Integer;
begin
  // vhndema

  xSQL:=	Mtx5000.FMant.SQL;

  DMLOG.cdsReporte.Close;
  DMLOG.cdsReporte.DataRequest( xSQL );
  DMLOG.cdsReporte.Open;

  if DMLOG.cdsReporte.RecordCount=0 then
  begin
      Raise Exception.Create('No existen Registros a mostrar');
  end;

   ppR1.DataPipeline:=ppdb1;

   if rgTipo.ItemIndex=0 then
      ppR1.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\MovimientoxAnoStockEJ.rtm'
   else
      ppR1.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\MovimientoxAnoImporteEJ.rtm';

   ppR1.template.LoadFromFile;

   ppdb1.DataSource:=DMLOG.dsReporte;

   if cbDisenoRep.Checked then
      ppd1.showmodal
   else
   begin
      ppR1.Print;

      ppR1.Stop;
      ppdb1.DataSource:=nil;

      x10:=Self.ComponentCount-1;
      while x10>=0 do
      begin
         if Self.Components[ x10 ].ClassName='TppGroup' then
         begin
            Self.Components[ x10 ].Free ;
         end;
         x10:=x10-1;
      end;
   end;
end;

procedure TFToolConAnno.dblcFAMEnter(Sender: TObject);
begin
   if dblcGrpArti.Text='' then dblcGrpArti.SetFocus;
end;

procedure TFToolConAnno.dblcSubFAMEnter(Sender: TObject);
begin
   if dblcFAM.Text='' then dblcFAM.SetFocus;
end;

procedure TFToolConAnno.bbtnJulDicClick(Sender: TObject);
var
   xSQL : String;
   x10  : Integer;
begin
  // vhndema
  xSQL:=	Mtx5000.FMant.SQL;

  DMLOG.cdsReporte.Close;
  DMLOG.cdsReporte.DataRequest( xSQL );
  DMLOG.cdsReporte.Open;

  if DMLOG.cdsReporte.RecordCount=0 then
  begin
      Raise Exception.Create('No existen Registros a mostrar');
  end;

   ppR1.DataPipeline:=ppdb1;

   if rgTipo.ItemIndex=0 then
      ppR1.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\MovimientoxAnoStockJD.rtm' 
   else
      ppR1.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\MovimientoxAnoImporteJD.rtm' ;

   ppR1.template.LoadFromFile;

   ppdb1.DataSource:=DMLOG.dsReporte;

   if cbDisenoRep.Checked then
      ppd1.showmodal
   else
   begin
      ppR1.Print;

      ppR1.Stop;
      ppdb1.DataSource:=nil;

      x10:=Self.ComponentCount-1;
      while x10>=0 do
      begin
         if Self.Components[ x10 ].ClassName='TppGroup' then
         begin
            Self.Components[ x10 ].Free ;
         end;
         x10:=x10-1;
      end;
   end;
end;

procedure TFToolConAnno.dblcAlmacenExit(Sender: TObject);
var
  sSQL : String;
begin
	sSQL:='TINID='+quotedstr(dblcTipInv.text)+' AND CIAID='+quotedstr(dblcCIA.text)+' AND ALMID='+quotedstr(dblcAlmacen.text);
  edtAlmacen.text   := DMLOG.DisplayDescrip('prvTGE','TGE151','ALMDES',sSQL,'ALMDES');
end;

procedure TFToolConAnno.bbtnMesClick(Sender: TObject);
var
   xSQL, cMes1, cMes2S, cMes2M : String;
   x10  : Integer;
   scad3, cFamdes, cSFamDes, cMesDes : string;
   Y, M, D   : Word;
begin
  // vhndema

  DecodeDate(DateS, Y, M, D);
  if dblcCia.text='' then
  begin
		ErrorMsg('Adquisiciones', ' Debe Escoger una Compañia ');
		dblcCia.SetFocus;
  exit;
	end;

  if dblcTipInv.text='' then
  begin
		ErrorMsg('Adquisiciones', ' Debe Escoger un Tipo de Inventario ');
		dblcTipInv.SetFocus;
  exit;
	end;

  if dblcGrpArti.text='' then
  begin
		ErrorMsg('Adquisiciones', ' Debe Escoger una Linea ó Grupo ');
		dblcGrpArti.SetFocus;
    exit;
	end;

   cFamdes :=dbeFam.Text;
   cSFamDes:=dbeSFam.Text;
   if dbeFam.Text=''  then cFamdes :='TODAS';
   if dbeSFam.Text='' then cSFamdes:='TODAS';

   cMes1:= DMLOG.StrZero( seMes.Text, 2 );

   if cMes1='01' then cMesDes:='E  N  E  R  O';
   if cMes1='02' then cMesDes:='F  E  B  R  E  R  O';
   if cMes1='03' then cMesDes:='M  A  R  Z  O';
   if cMes1='04' then cMesDes:='A  B  R  I  L';
   if cMes1='05' then cMesDes:='M  A  Y  O';
   if cMes1='06' then cMesDes:='J  U  N  I  O';
   if cMes1='07' then cMesDes:='J  U  L  I  O';
   if cMes1='08' then cMesDes:='A  G  O  S  T  O';
   if cMes1='09' then cMesDes:='S  E  T  I  E  M  B  R  E';
   if cMes1='10' then cMesDes:='O  C  T  U  B  R  E';
   if cMes1='11' then cMesDes:='N  O  V  I  E  M  B  R  E';
   if cMes1='12' then cMesDes:='D  I  C  I  E  M  B  R  E';

   cMes2S:= 'SUM(NVL(STKTSG'+DMLOG.StrZero( IntToStr(seMes.Value+1), 2 )+',0)) ';
   cMes2M:= 'SUM(NVL(STKTSG'+DMLOG.StrZero( IntToStr(seMes.Value+1), 2 )+'*ARTPCG,0)) ';
   //cMes2M:= 'SUM(NVL(STKTMG'+DMLOG.StrZero( IntToStr(seMes.Value+1), 2 )+',0)) ';
   if seMes.Value=12 then
   begin
      cMes2S:= 'SUM(NVL(STKSACTG,0)) ';
      cMes2M:= 'SUM(NVL(STKSACTG*ARTPCG,0)) ';
      //cMes2M:= 'SUM(NVL(STKMACTG,0)) ';
   end;

   xSQL:='Select STKANO, A.CIAID, C.CIADES, A.LOCID, A.TINID, ALMID, A.GRARID, A.FAMID, A.SFAMID, A.ARTID, A.UNMIDG, '
        +  'L.MARCA, M.MARDES, L.TIPART, T.TIPARTDES, L.MODELO, L.PROV, P.PROVDES, L.CARART, '
        +  'I.TINDES, G.GRARDES, F.FAMDES, S.SFAMDES, L.ARTDES, '
        +  ''''+cFamdes+''' TITFAM, '''+cSFamdes+''' TITSFAM, '''+cMesDes+''' TITMES, '

        +  'SUM(NVL(STKTSG'+cMes1+',0)) MES_SS, SUM(NVL(STKISG'+cMes1+',0)) MES_IS, SUM(NVL(STKSSG'+cMes1+',0)) MES_ES, '+cMes2S+' MES_AS, '
        +  'SUM(NVL(STKTSG'+cMes1+'*ARTPCG,0)) MES_SM, SUM(NVL(STKISG'+cMes1+'*ARTPCG,0)) MES_IM, SUM(NVL(STKSSG'+cMes1+'*ARTPCG,0)) MES_EM, '+cMes2M+' MES_AM '
        // 'SUM(NVL(STKTMG'+cMes1+',0)) MES_SM, SUM(NVL(STKIMG'+cMes1+',0)) MES_IM, SUM(NVL(STKSMG'+cMes1+',0)) MES_EM, '+cMes2M+' MES_AM '

        +'from LOG316 A, TGE205 L, ALM_MAR_ART M, ALM_TIP_ART T, TGE201 P, TGE101 C, '
        +     'TGE152 I, TGE131 G, TGE169 F, TGE170 S '
        +'WHERE A.CIAID='+quotedStr(dblcCia.text)
        + ' AND A.STKANO='''+seAno.Text+''' '
        + ' AND A.TINID  LIKE '''+dblcTipInv.Text +'%'' '
        + ' AND A.ALMID  LIKE '''+dblcAlmacen.Text+'%'' '

        + ' AND A.GRARID LIKE '''+dblcGrpArti.text+'%'' '
        + ' AND A.FAMID  LIKE '''+dblcFAM.text    +'%'' '
        + ' AND A.SFAMID LIKE '''+dblcSubFAM.Text +'%'' '

        + ' AND A.CIAID=I.CIAID AND A.TINID=I.TINID(+) '
        + ' AND A.CIAID=G.CIAID AND A.TINID=G.TINID(+) AND A.GRARID=G.GRARID(+) '
        + ' AND A.CIAID=F.CIAID AND A.TINID=F.TINID(+) AND A.GRARID=F.GRARID(+) AND A.FAMID=F.FAMID(+) '
        + ' AND A.CIAID=S.CIAID AND A.TINID=S.TINID(+) AND A.GRARID=S.GRARID(+) AND A.FAMID=S.FAMID(+) '
        + ' AND A.SFAMID=S.SFAMID(+) '

        + ' AND A.CIAID=L.CIAID(+) AND A.TINID=L.TINID(+) AND A.ARTID=L.ARTID(+) '

        + ' AND L.MARCA=M.MARCA(+) ';

   if dblcdMarca.Text='' then
      xSQL:=xSQL+'' //and L.MARCA(+) LIKE '''+dblcdMarca.Text+'%'' '
   else
      xSQL:=xSQL+'and L.MARCA LIKE '''+dblcdMarca.Text+'%'' ';

   xSQL:=xSQL
        +  'AND (L.TIPART=T.TIPART(+)) ';

   if dblcdArtTipo.Text='' then
      xSQL:=xSQL+'' //and L.TIPART(+) LIKE '''+dblcdArtTipo.Text+'%'' '
   else
      xSQL:=xSQL+'and L.TIPART LIKE '''+dblcdArtTipo.Text+'%'' ';

   xSQL:=xSQL
        +  'AND (P.CLAUXID(+)=''P'' AND L.PROV=P.PROV(+)) ';

   if dblcdProv.Text='' then
      xSQL:=xSQL+'and P.PROV(+) LIKE '''+dblcdProv.Text+'%'' '
   else
      xSQL:=xSQL+'and P.PROV LIKE '''+dblcdProv.Text+'%'' ';

   xSQL:=xSQL
        + ' AND A.CIAID=C.CIAID(+) '
        +'GROUP BY STKANO, A.CIAID, C.CIADES, A.LOCID, A.TINID, ALMID, A.GRARID, A.FAMID, A.SFAMID, '
        +  'A.ARTID, A.UNMIDG, L.MARCA, M.MARDES, L.TIPART, T.TIPARTDES, L.MODELO, L.PROV, P.PROVDES, '
        +  'L.CARART, I.TINDES, G.GRARDES, F.FAMDES, S.SFAMDES, L.ARTDES '
        +'ORDER BY L.PROV, ARTID ';

  xSQL := 'select * from ('+xSQL+') SOLVISTA ';

  DMLOG.cdsReporte.Close;
  DMLOG.cdsReporte.DataRequest( xSQL );
  DMLOG.cdsReporte.Open;

  if DMLOG.cdsReporte.RecordCount=0 then
  begin
      Raise Exception.Create('No existen Registros a mostrar');
  end;

   ppR1.DataPipeline:=ppdb1;

   if rgTipo.ItemIndex=0 then
      ppR1.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\MovimientoxMesStock.rtm'
   else
      ppR1.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\MovimientoxMesImporte.rtm';

   ppR1.template.LoadFromFile;

   ppdb1.DataSource:=DMLOG.dsReporte;
   
   if cbDisenoRep.Checked then
      ppd1.showmodal
   else
   begin
      ppR1.Print;

      ppR1.Stop;
      ppdb1.DataSource:=nil;

      x10:=Self.ComponentCount-1;
      while x10>=0 do
      begin
         if Self.Components[ x10 ].ClassName='TppGroup' then
         begin
            Self.Components[ x10 ].Free ;
         end;
         x10:=x10-1;
      end;
   end;
end;

procedure TFToolConAnno.sbDisenoRepClick(Sender: TObject);
begin
   cbDisenoRep.Checked := not cbDisenoRep.Checked;
end;

end.


