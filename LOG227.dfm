�
 TFREGORDCDEP 0�: TPF0TFRegOrdCDepFRegOrdCDepLeftUTopGBorderIconsbiSystemMenu
biMinimize BorderStylebsDialogCaption   Depuración de Orden de Compra ClientHeight=ClientWidth Color��� Constraints.MaxHeight`Constraints.MaxWidth(Constraints.MinHeightXConstraints.MinWidth Font.CharsetANSI_CHARSET
Font.ColorclNavyFont.Height�	Font.NameComic Sans MS
Font.Style 	FormStyle
fsMDIChild
KeyPreview	OldCreateOrderPositionpoScreenCenterVisible	OnClose	FormClose
OnKeyPressFormKeyPressOnShowFormShowPixelsPerInch`
TextHeight TPanelpnlCabeceraLeft Top Width HeightAlignalTop
BevelInnerbvRaised
BevelOuter	bvLoweredColor��� Font.CharsetANSI_CHARSET
Font.ColorclNavyFont.Height�	Font.NameComic Sans MS
Font.Style 
ParentFontTabOrder  TBevelBevel1LeftTop	WidthHeight� ShapebsFrame  TLabellblCiaLeftTopWidth1HeightCaption
   Compañía  TLabellblObsLeftTop� Width� HeightCaptionObservaciones / Comentarios  TLabellblTMonLeftwTop8WidthBHeightCaptionTipo Moneda  TLabellblFEmiLeftTop8WidthIHeightCaption   Fecha Emisión  TLabel	lblConComLefteTop8WidthHeightCaptionCondiciones Comerciales  TLabellblProfLeft*TopWidthAHeightCaption   Nº Proforma  TLabellblFEntLeftvTop8WidthIHeightCaptionFecha Entrega  TLabellblFRegLeft�TopWidth[HeightCaptionFecha de Registro  TLabellblDEntLeft� Top8WidthJHeightCaption   Entrega (Días)  TLabellblDValLeft&Top8WidthHHeightCaption   Validez (Días)  TLabellblTCamLeftTop8WidthNHeightCaptionTipo de Cambio  TLabellblProvLeft�TopWidth4HeightCaption	Proveedor  TLabellblFleLeft� TopaWidthEHeightCaptionImporte Flete  TLabellblNroLeft� TopWidthCHeightCaption   Nº O.Compra  TLabel LeftPTop� Width;HeightCaption
% ImpuestoVisible  TLabellblLEntLeftTopaWidthWHeightCaptionLugar de Entrega  TLabellblTComLeft%Top_WidthOHeightCaptionTipo de Compra  TwwDBLookupCombodblcCIALeftTopWidth1HeightDropDownAlignmenttaLeftJustifySelected.StringsCIAID	2	ID	F   CIADES	40	Descripción	FCIAABR	15	Abreviatura	F 	DataFieldCIAID
DataSourceDMLOG.dsOrdCompLookupTableDMLOG.cdsCIALookupFieldCIAIDOptions
loColLinesloTitles DropDownCountTabOrder AutoDropDown
ShowButton	SearchDelayPreciseEditRegionAllowClearKey	ShowMatchText	OnExit
dblcdExits  TBitBtnZ2bbtnOKLeft�Top� WidthHeightHintAceptarFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontParentShowHintShowHint	TabOrderOnClickZ2bbtnOKClick
Glyph.Data
�  �  BM�      v   (   $            h                      �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� 333333333333333333  333333333333�33333  334C33333338�33333  33B$3333333�8�3333  34""C33333833�3333  3B""$33333�338�333  4"*""C3338�8�3�333  2"��"C3338�3�333  :*3:"$3338�38�8�33  3�33�"C333�33�3�33  3333:"$3333338�8�3  33333�"C333333�3�3  33333:"$3333338�8�  333333�"C333333�3�  333333:"C3333338�  3333333�#3333333��  3333333:3333333383  333333333333333333  	NumGlyphs  TDBMemodbmObsLeftTop� Width�Height:	DataFieldODCOBS
DataSourceDMLOG.dsOrdCompFont.CharsetANSI_CHARSET
Font.ColorclNavyFont.Height�	Font.NameCourier
Font.PitchfpFixed
Font.Style 
ParentFontTabOrder
OnKeyPressdbmObsKeyPress  TwwDBLookupCombodblcTMonedaLeftwTopHWidth1HeightDropDownAlignmenttaLeftJustifySelected.StringsTMONID	3	ID	FTMONDES	30	Moneda	FTMONABR	8	Abreviatura	F 	DataFieldTMONID
DataSourceDMLOG.dsOrdCompLookupTableDMLOG.cdsTMonedaLookupFieldTMONIDOptions
loColLines
loRowLinesloTitles TabOrder
AutoDropDown
ShowButton	SearchDelayPreciseEditRegionAllowClearKey	ShowMatchText	OnExit
dblcdExits  TwwDBDateTimePicker	dbdtpFEmiLeftTopHWidth_HeightCalendarAttributes.Font.CharsetDEFAULT_CHARSETCalendarAttributes.Font.ColorclWindowTextCalendarAttributes.Font.Height�CalendarAttributes.Font.NameMS Sans SerifCalendarAttributes.Font.Style 	DataFieldODCFEMI
DataSourceDMLOG.dsOrdCompEpoch�
ShowButton	TabOrderDisplayFormat
dd/mm/yyyyOnExit
dblcdExits  TwwDBLookupCombo	dblcFPagoLeftcTopHWidth1HeightDropDownAlignmenttaLeftJustifySelected.StringsCCOMERID	2	ID	F"CCOMERDES	30	Condicion Comercial	F 	DataFieldCCOMERID
DataSourceDMLOG.dsOrdCompLookupTableDMLOG.cdsFPagoLookupFieldCCOMERIDOptions
loColLinesloTitles DropDownCountTabOrderAutoDropDown
ShowButton	SearchDelayPreciseEditRegionAllowClearKey	ShowMatchText	OnExit
dblcdExits  	TwwDBEditdedNProformaLeft(TopWidthpHeightCharCaseecUpperCase	DataFieldPROFID
DataSourceDMLOG.dsOrdCompEnabled	MaxLengthTabOrderUnboundDataType	wwDefaultWantReturnsWordWrapOnExitdedNProformaExit  TwwDBDateTimePicker	dbdtpFAttLefttTopHWidth_HeightCalendarAttributes.Font.CharsetDEFAULT_CHARSETCalendarAttributes.Font.ColorclWindowTextCalendarAttributes.Font.Height�CalendarAttributes.Font.NameMS Sans SerifCalendarAttributes.Font.Style 	DataFieldODCFATE
DataSourceDMLOG.dsOrdCompEpoch�
ShowButton	TabOrderDisplayFormat
dd/mm/yyyy  TwwDBDateTimePicker	dbdtpFRegLeft�TopWidth_HeightCalendarAttributes.Font.CharsetDEFAULT_CHARSETCalendarAttributes.Font.ColorclWindowTextCalendarAttributes.Font.Height�CalendarAttributes.Font.NameMS Sans SerifCalendarAttributes.Font.Style 	DataFieldODCFREG
DataSourceDMLOG.dsOrdCompEpoch�Enabled
ShowButton	TabOrderDisplayFormat
dd/mm/yyyy  TwwDBSpinEditdbseEntLeft� TopHWidthPHeight	Increment       ��?MaxValue    ���@MinValue       ��?Value       ��?	DataFieldODCTEN
DataSourceDMLOG.dsOrdCompTabOrderUnboundDataType	wwDefault  TwwDBSpinEditdbsbValLeft(TopHWidthLHeight	Increment       ��?MaxValue    ���@MinValue       ��?Value       ��?	DataFieldODCVALID
DataSourceDMLOG.dsOrdCompTabOrder	UnboundDataType	wwDefault  	TwwDBEdit
dbeTCambioLeftTopHWidthPHeightCharCaseecUpperCase	DataFieldODCTCAMB
DataSourceDMLOG.dsOrdCompTabOrderUnboundDataType	wwDefaultWantReturnsWordWrap  TwwDBLookupComboDlg	dblcdProvLeft�TopWidthWHeightCharCaseecUpperCaseGridOptionsdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgRowSelectdgAlwaysShowSelectiondgConfirmDeletedgPerfectRowFit 	GridColorclWhiteGridTitleAlignmenttaCenterCaptionProveedoresMaxWidth 	MaxHeight� Selected.Strings   PROV	9	Código	F   PROVRUC	12	Nº RUC	F   PROVDES	30	Razón Social	F PROVNOMCOM	30	Nombre Comercial	F 	DataFieldPROV
DataSourceDMLOG.dsOrdCompLookupTableDMLOG.cdsProvLookupFieldPROVTabOrderAutoDropDown
ShowButton	AllowClearKey	ShowMatchText	OnEnterdblcdProvEnterOnExitdblcdProvExit  	TwwDBEditdbeFleteLeft� TopoWidthKHeightCharCaseecUpperCase	DataFieldODCIXFLE
DataSourceDMLOG.dsOrdCompTabOrderUnboundDataType	wwDefaultWantReturnsWordWrap  	TwwDBEditdbeNRegLeft� TopWidthMHeightCharCaseecUpperCaseColorclInfoBk	DataFieldODCID
DataSourceDMLOG.dsOrdComp	MaxLengthTabOrderUnboundDataType	wwDefaultWantReturnsWordWrapOnExitdbeNRegExit  TwwDBLookupCombodblcLEntregaLeftTopoWidth1HeightDropDownAlignmenttaLeftJustifySelected.Strings   LGECID	2	Código	F   LGECDES	40	Descripción	FLGECABR	15	Abreviatura	F 	DataFieldLGECID
DataSourceDMLOG.dsOrdCompLookupTableDMLOG.cdsLEntregaLookupFieldLGECIDOptions
loColLines
loRowLinesloTitles DropDownCountTabOrderAutoDropDown
ShowButton	SearchDelayPreciseEditRegionAllowClearKey	ShowMatchText	OnExit
dblcdExits  TBitBtnZ2bbtnBorrarLeft�Top� WidthHeightHint	ModificarFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontParentShowHintShowHint	TabOrderOnClickZ2bbtnBorrarClick
Glyph.Data
z  v  BMv      v   (                                       �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� P  UUUWwwuU�U    UPUUwwwwU�UU U PUUUw�wWUUU UPUUUUw�W_�UUPP UUUW�uw�UUU PPUUUw�Ww�UUU	�UUU�uwww�UPU	��UW_wwwu�PP��0UWu�wwW_U PU	UwWUwuuuUUUUP��0UU_UWWWWUUUU3UUuUUuuUUUUUUP��UU�UUW_UUPUUUU�UWUUUUu�UUUUUUP�UUUUUUW_UUUUUUUUUUUUUUu	NumGlyphs  TEditedtCIALeftCTopWidth� HeightEnabledTabOrder  TEdit
edtTMonedaLeft�TopHWidthfHeightEnabledTabOrder  TEditedtFPagoLeft�TopHWidthoHeightEnabledTabOrder  TEditedtLEntregaLeftCTopoWidth� HeightEnabledTabOrder  TwwDBLookupCombodblcTipoCompraLeft&TopoWidth1HeightCharCaseecUpperCaseDropDownAlignmenttaLeftJustifySelected.StringsTIPOADQ	2	Tipo de Compra	F   TIPADQDES	30	Descripción	F 	DataFieldTIPOADQ
DataSourceDMLOG.dsOrdCompLookupTableDMLOG.cdsTipSolLookupFieldTIPOADQOptions
loColLinesloTitles 	MaxLengthTabOrderAutoDropDown
ShowButton	SearchDelayPreciseEditRegionAllowClearKeyShowMatchText	OnExit
dblcdExits  TEditedtTipoCompraLeftXTopoWidth� HeightEnabledTabOrder  	TwwDBEditedtProvLeftSTopWidth� HeightCharCaseecUpperCase	DataFieldPROVDES
DataSourceDMLOG.dsOrdCompEnabled	MaxLengthTabOrderUnboundDataType	wwDefaultWantReturnsWordWrap  TPanel	pnlColocaLeftTop`Width� Height8Color��� TabOrder TLabellblUsuLeftTop Width(HeightCaptionUsuario  TLabellblFecLeft� Top WidthHeightCaptionFecha  TLabellblColLeft`Top(Width8HeightCaption   Colocación  	TwwDBEdit	wwDBEdit1LeftTopWidth� Height	DataField	OCCOLOCAC
DataSourceDMLOG.dsOrdCompEnabledTabOrder UnboundDataType	wwDefaultWantReturnsWordWrap  	TwwDBEdit	wwDBEdit2Left� TopWidthNHeight	DataField
OCCOLOFREG
DataSourceDMLOG.dsOrdCompEnabledTabOrderUnboundDataType	wwDefaultWantReturnsWordWrap    TPanelpnlDetalleGLeftTopWidthHeight9
BevelInnerbvRaised
BevelOuter	bvLoweredColor��� Font.CharsetANSI_CHARSET
Font.ColorclNavyFont.Height�	Font.NameComic Sans MS
Font.Style 
ParentFontTabOrder TBevelbvlTLeftTop� WidthHeight1ShapebsFrame  TBevelBevel2LeftTopWidthHeightShape	bsTopLine  TLabel Left[Top� Width+HeightAutoSizeCaptionTOTALColorclRedFont.CharsetANSI_CHARSET
Font.ColorclBlueFont.Height�	Font.NameComic Sans MS
Font.StylefsBold ParentColor
ParentFontTransparent	  TLabel Left�Top� WidthWHeightCaptionTotal DescuentoFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameComic Sans MS
Font.StylefsBold 
ParentFontTransparent	  TLabel LeftYTop� WidthHHeightCaptionTotal CompraFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameComic Sans MS
Font.StylefsBold 
ParentFontTransparent	  TLabel Left� Top� Width<HeightCaptionTotal FleteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameComic Sans MS
Font.StylefsBold 
ParentFontTransparent	  TLabel Left%Top� WidthRHeightCaptionTotal ImpuestoFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameComic Sans MS
Font.StylefsBold 
ParentFontTransparent	  TLabel Left�Top� Width6HeightCaption	Total ISCFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameComic Sans MS
Font.StylefsBold 
ParentFontTransparent	  TStaticText
stxTitulo1LeftTopWidthHeightAlignalTop	AlignmenttaCenterBorderStyle	sbsSunkenCaption&Detalle de Registro de Orden de CompraColorclHighlightEnabledFont.CharsetDEFAULT_CHARSET
Font.ColorclHighlightTextFont.Height�	Font.NameMS Sans Serif
Font.Style ParentColor
ParentFontShowAccelCharTabOrder   TPanel	pnlEstadoLeftTopWidth� Height Color	cl3DLightTabOrder TLabel LeftTopWidth.HeightCaptionEstado:Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFont  TDBText
btxtEstadoLeftITopWidthrHeight	AlignmenttaCenter	DataFieldODCEST
DataSourceDMLOG.dsOrdCompFont.CharsetDEFAULT_CHARSET
Font.ColorclBlueFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontTransparent	   	TwwDBEditdbeTotalLeft\Top� WidthcHeightCharCaseecUpperCase	DataField	ODCTOTALG
DataSourceDMLOG.dsOrdCompEnabledFont.CharsetDEFAULT_CHARSET
Font.ColorclBlueFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontReadOnly	TabOrderUnboundDataType	wwDefaultWantReturnsWordWrap  	TwwDBEdit
dbeTCompraLeftXTop� WidthcHeightCharCaseecUpperCase	DataFieldODCIXTCC
DataSourceDMLOG.dsOrdCompEnabledFont.CharsetDEFAULT_CHARSET
Font.ColorclBlueFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontTabOrderUnboundDataType	wwDefaultUsePictureMaskWantReturnsWordWrap  	TwwDBEdit	dbeTFleteLeft� Top� WidthcHeightCharCaseecUpperCase	DataFieldODCIXFLE
DataSourceDMLOG.dsOrdCompEnabledFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontTabOrderUnboundDataType	wwDefaultUsePictureMaskWantReturnsWordWrap  	TwwDBEdit
dbeTimpuesLeft%Top� WidthcHeightCharCaseecUpperCase	DataField	ODCTTIMPU
DataSourceDMLOG.dsOrdCompEnabledFont.CharsetDEFAULT_CHARSET
Font.ColorclBlueFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontTabOrderUnboundDataType	wwDefaultUsePictureMaskWantReturnsWordWrap  TButton	Z2btnDescLeft�Top� WidthHeightHint!Editar el contenido del DescuentoCaption>EnabledFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontParentShowHintShowHint	TabOrderTabStopOnClickZ2btnDescClick  	TwwDBEditdbeDescLeftTop� WidthMHeightCharCaseecUpperCase	DataFieldODCIXTD
DataSourceDMLOG.dsOrdCompEnabledFont.CharsetDEFAULT_CHARSET
Font.ColorclRedFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontTabOrderUnboundDataType	wwDefaultUsePictureMaskWantReturnsWordWrapOnExitdbeDescExit  	TwwDBEdit	dbeTotISCLeft�Top� WidthcHeightCharCaseecUpperCase	DataFieldODCTOTALISC
DataSourceDMLOG.dsOrdCompEnabledFont.CharsetDEFAULT_CHARSET
Font.ColorclBlueFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontTabOrderUnboundDataType	wwDefaultUsePictureMaskWantReturnsWordWrap  TBitBtnZ2bbtnRegresaLeft@TopWidth HeightHintModifica Datos de CabeceraParentShowHintShowHint	TabOrder	TabStopOnClickZ2bbtnRegresaClick
Glyph.Data
�  �  BM�      6   (               d                  ������������������   �  �  �  �  �  �  �  �  �     ������������                  �     �  �  �  �  �  �  �              ���   ������������                                 ������   ���   ������������      �����������̙����̙��      ������   ���   ���������   ������������������fff�����̙��   ������   ���   ���������   �����������������̙��fff���fff   ������   ���   ���������������������������fff   fff��̙��   ������   ���   ������   ���������������   ���   ���         ������   ���   ������   ���������������            fff���      ���   ���   ������   ���������������      fff���   ���fff   ���   ���   ������   ������������fff   ���   ���   fff���   ���   ���   ������   ���������������   ���   fff���      ������   ���   ������   ������fff������   fff���   ���   ���������   ���   ������   ������   ������      ���      ������������   ���   ������   ������      ���fff         ���������������   ���   ������   ������      ������   ���������������������   ���   ������   ������      ������   ������                  ���   ������   ������   ���      ���������   ���������   ������   ������   ������   ������������������   ������   ���������   ������   ���fff   ������������������   ���   ������������            ������                           ������������������������   ������   ���������������������������������������������������      ���������������������������������������  TBitBtnZ2bbtnCanc2Left�TopWidth HeightHint#Cancela Actualizaciones del DetalleParentShowHintShowHint	TabOrder
TabStopOnClickZ2bbtnCanc2Click
Glyph.Data
�  �  BM�      v   (   $            h                      �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� 333333333333333333  3�33333333?333333  3��33�333��33?33  3�39�38�3?��3  39���38�8��3�3  33�338�3��38�  339�333�3833�3  333�33338�33?�3  3331�33333�33833  3339�333338�3�33  333��33333833�33  33933333�33�33  33����333838�8�3  3939333�3��3�3  3��33��33��38�8�  3�3339338�33���  393333��3333338�3  333333333333333333  	NumGlyphs  TBitBtnZ2bbtnGrabaLeftjTopWidth HeightHintGrabar RegistroParentShowHintShowHint	TabOrderOnClickZ2bbtnGrabaClick
Glyph.Data
�  �  BM�      v   (                                     �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 3333333333300 wwwwww 0  ������  0  �����  0  �����  0  �����  0  ������  0           0           0  �������  0  �������  0  �������  0  �������  0  �������  0  �������  0  �������  0  �������  0  �������  0  �������  0  �������p0  �������p0  �������  00 ������� 0  TBitBtnZ2bbtnAceptaLeft�TopWidth HeightHintAcepta RegistroParentShowHintShowHint	TabOrderOnClickZ2bbtnAceptaClick
Glyph.Data
�  �  BM�      v   (   $            |                      �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� 334C33333338�33333  33B$3333333�8�3333  34""C33333833�3333  3B""$33333�338�333  4"*""C3338�?33�333  2"��"C3338��3�333  :*"*"$3338�3?38�33  4�""�"C338�33�3�33  B"�"*"$33�3�3?38�3  "*:"$�"C3�88�8�3�3  ��3�"J"$3��3�3�38�  :33:"$�"C8338�8�3�  3333�"J"C3333�3�3�  3333:"$�#33338�8�3  33333�"J333333�3�3  33333:"$3333338�8�  333333�$3333333�8�  333333:"33333338��  3333333�33333333�3  	NumGlyphs  TBitBtnZ2bbtnAnulaLeftTopWidth HeightHintAnular DocumentoParentShowHintShowHint	TabOrderTabStopOnClickZ2bbtnAnulaClick
Glyph.Data
�  �  BM�      v   (                                      �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� ����������� ����������� ��       �� ����������� ����������� �	�������� ��������� ��������� ��������� ��������� ��������� ��������� ��������� ��������� ��������� ��������� ��������� �	�������� ����������� ����������� ����������� �        	� ����������� �����������   TBitBtnZ2bbtnSalirLeft�TopWidth HeightHint   Salir de RequisiciónFont.CharsetANSI_CHARSET
Font.ColorclRedFont.Height�	Font.NameGaramond
Font.StylefsBoldfsItalic 
ParentFontParentShowHintShowHint	TabOrderOnClickZ2bbtnSalirClick
Glyph.Data
�  �  BM�      v   (   $            h                       �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� 8����w���������33?  DD@���DD������3��  33MP��33�����38��  33E���3333���38�?  33M]��3333�x�38�?  33E���3333���38�?  33M]��3333�x�38�?  33E���3333���38�?  33M]��3333�x�38�?  33E���3333���38�?  33M]��3333�x�38�?  33E���3333���38�?  33M]��3333�x�38�?  33DDDDD3333������?  33333333333�����3?  333   333333?���3?  333
��333333����3?  333   333333����3?  	NumGlyphs  TBitBtnZ2bbtnColocacLeft�TopWidth HeightHint   ColocaciónCaptionCFont.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameGaramond
Font.StylefsBold 
ParentFontParentShowHintShowHint	TabOrderTabStopOnClickZ2bbtnColocacClick	NumGlyphs  TBitBtnZ2bbtnPrintLeftTopWidth HeightHintEmitir Orden de CompraParentShowHintShowHint	TabOrderOnClickZ2bbtnPrintClick
Glyph.Data
z  v  BMv      v   (                                       �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 0      7wwwwwws�������3333337��������������        wwwwwwww�������333333��������3333377��������������        wwwwwwww30����337���?330� 337�wss330����337��?�330�  337�swws330���3337��73330��3337�3s3330�� 33337��w33330  33337wws333	NumGlyphs  	TwwDBGrid	dbgDepuraLeftTopWidthHeight� DisableThemesInTitleSelected.Strings   DODCID	4	Nº~Item   ARTID	8	Código~ArtículoDODCOBS	34	DetalleUNMID	5	Unid.~MedidaDODCPUN	8	Precio~UnitarioDODCIMP	10	Valor~Venta	FDODCCNT	10	Cantidad~PedidaDODCCATE	10	Cantidad~AtendidaDODCCSLD	10	Cantidad~Saldo MemoAttributes	mGridShow	mViewOnlymDisableDialog IniAttributes.Delimiter;;
TitleColor�ss 	FixedCols ShowHorzScrollBar	Color��� 
DataSourceDMLOG.dsDOrdCompFont.CharsetANSI_CHARSET
Font.ColorclNavyFont.Height�	Font.NameComic Sans MS
Font.Style 
KeyOptionsdgEnterToTab OptionsdgTitlesdgIndicatordgColumnResize
dgColLinesdgTabsdgConfirmDeletedgCancelOnExit
dgWordWrap 
ParentFontTabOrderTitleAlignmenttaCenterTitleFont.CharsetANSI_CHARSETTitleFont.ColorclNavyTitleFont.Height�TitleFont.NameComic Sans MSTitleFont.Style 
TitleLinesTitleButtons
UseTFields
OnDblClickdbgDepuraDblClick  TBitBtnZ2bbtnPrintDepuradasLeftKTopWidth HeightHintEmite Orden de Compra DepuradaParentShowHintShowHint	TabOrderOnClickZ2bbtnPrintDepuradasClick
Glyph.Data
z  v  BMv      v   (                                       �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 0      7wwwwwws�������3333337��������������        wwwwwwww�������333333��������3333377��������������        wwwwwwww30����337���?330� 337�wss330����337��?�330�  337�swws330���3337��73330��3337�3s3330�� 33337��w33330  33337wws333	NumGlyphs   TPanelpnlDetalleALeft� Top� Width�HeightColor��� Font.CharsetANSI_CHARSET
Font.ColorclNavyFont.Height�	Font.NameComic Sans MS
Font.Style 
ParentFontTabOrderVisible TBevel
bvlDetalleLeftTopWidth�Height� ShapebsFrame  TLabellblNItemLeftTopWidthHeightCaption   NºTransparent	  TLabel LeftUTopWidth$HeightCaptionDetalleTransparent	  TLabellblUMedLeftTop� Width\HeightCaptionUnidad de MedidaTransparent	  TLabel LeftTop� Width-HeightCaptionCantidadTransparent	  TLabel LeftETop� WidthOHeightCaptionPrecio UnitarioTransparent	  TLabellblDescLeftTop� WidthAHeightCaptionDescuento %Transparent	  TLabel LeftSTop� WidthFHeightCaptionImporte TotalTransparent	  TLabel Left`Top� Width;HeightCaption
Impuesto %Transparent	  TLabel Left� Top� Width!HeightCaptionISC %Transparent	  TLabel LeftTopDWidth*HeightCaptionArticuloTransparent	  TLabelLabel1Left� Top� Width$HeightCaptionT. Adq.  TLabel Left� Top� Width;HeightCaptionValor VentaTransparent	  TBitBtnZ2bbtnRegOkLeft`Top� WidthHeightHint   Confirma ActualizaciónParentShowHintShowHint	TabOrderOnClickZ2bbtnRegOkClick
Glyph.Data
�  �  BM�      v   (   $            h                      �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� 333333333333333333  333333333333�33333  334C33333338�33333  33B$3333333�8�3333  34""C33333833�3333  3B""$33333�338�333  4"*""C3338�8�3�333  2"��"C3338�3�333  :*3:"$3338�38�8�33  3�33�"C333�33�3�33  3333:"$3333338�8�3  33333�"C333333�3�3  33333:"$3333338�8�  333333�"C333333�3�  333333:"C3333338�  3333333�#3333333��  3333333:3333333383  333333333333333333  	NumGlyphs  TBitBtnZ2bbtnRegCancLeft�Top� WidthHeightHint   Cancela ActualizaciónParentShowHintShowHint	TabOrderOnClickZ2bbtnRegCancClick
Glyph.Data
�  �  BM�      v   (   $            h                      �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� 333333333333333333  33�33333333?333333  39�33�3333��33?33  3939�338�3?��3  39��338�8��3�3  33�338�3��38�  339�333�3833�3  333�33338�33?�3  3331�33333�33833  3339�333338�3�33  333��33333833�33  33933333�33�33  33����333838�8�3  33�39333�3��3�3  33933�333��38�8�  33333393338�33���  3333333333333338�3  333333333333333333  	NumGlyphs  TStaticText
stxTitulo2LeftTopWidth�HeightAlignalTop	AlignmenttaCenterBorderStyle	sbsSunkenCaption(Detalle de Registro de Ordenes de CompraColorclHighlightEnabledFont.CharsetDEFAULT_CHARSET
Font.ColorclHighlightTextFont.Height�	Font.NameMS Sans Serif
Font.Style ParentColor
ParentFontShowAccelCharTabOrder   TwwDBLookupCombodblcUMedLeftTop� Width3HeightDropDownAlignmenttaLeftJustifySelected.Strings   UNMID	2	Código	FUNMDES	20	Unidad de Medida	FUNMABR	10	Abreviatura	F 	DataFieldUNMIDLookupTableDMLOG.cdsUMedLookupFieldUNMIDEnabledTabOrderAutoDropDown
ShowButton	PreciseEditRegionAllowClearKey	ShowMatchText	OnExitdblcUMedExit  TEditedtUMedLeftFTop� Width� HeightEnabledTabOrder  	TwwDBEdit	dbcldArtiLeftTopSWidth?HeightCharCaseecUpperCaseColorclInfoBkEnabled	MaxLengthTabOrderUnboundDataType	wwDefaultWantReturnsWordWrap  TEditdbeCntTagLeftTop� Width5HeightEnabledTabOrder  TEditdbeDsctoLeftTop� WidthKHeightEnabledTabOrderOnExitdbeDsctoExit  TEdit	dbeImpIndTagLeft^Top� WidthKHeightEnabledTabOrder	OnExitdbeDsctoExit  TEditdbeISCTagLeft� Top� WidthKHeightEnabledTabOrder
OnExitdbeDsctoExit  TEdit
dbeImporteLeftQTop� WidthUHeightEnabledTabOrder  TMemo
memDetalleLeftRTop,WidthSHeightOTabOrder  TEditdbeItemLeftTop,Width?HeightEnabledTabOrder  TEditdbePUnitTagLeftBTop� WidthdHeightBiDiModebdLeftToRightEnabledParentBiDiModeTabOrderText0OnExitdbeDsctoExit  TEditedtAdqLeft� Top� Width-HeightEnabledTabOrder  TEdit	dbeValVenTagLeft� Top� WidthUHeightEnabledTabOrder   TppDBPipelineppdbOCUserNamedbOCLeft�Top�   TppDBPipelineppDBCabUserNameDBCabLeftTop�   	TppReportpprOCPAutoStopDataPipelineppdbOCOnStartPagepprOCPStartPagePrinterSetup.BinNameDefaultPrinterSetup.DocumentNameReport1PrinterSetup.PaperNameCustomPrinterSetup.PrinterNameDefaultPrinterSetup.mmMarginBottom^PrinterSetup.mmMarginLeft PrinterSetup.mmMarginRight^PrinterSetup.mmMarginTop'PrinterSetup.mmPaperHeight�E PrinterSetup.mmPaperWidthp� PrinterSetup.PaperSize Template.FileName*C:\SOLCompras\SOLFormatos\Ord_Comp_JCP.rtmUnitsutMillimeters
AfterPrintpprOCPAfterPrintBeforePrintpprOCPBeforePrint
DeviceTypeScreenOnPreviewFormCreatepprOCPPreviewFormCreateOutlineSettings.CreateNode	OutlineSettings.CreatePageNodes	OutlineSettings.EnabledOutlineSettings.Visible TextSearchSettings.DefaultString
<FindText>TextSearchSettings.EnabledLeft
Top� Version7.02mmColumnWidth DataPipelineNameppdbOC TppHeaderBandppHeaderBand3PrintHeight	phDynamicmmBottomOffset mmHeight�% mmPrintPosition  	TppDBText
ppDBText21UserName	pdbtSRES2	DataFieldPROVDESDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameRoman 12cpi	Font.Size
Font.Style ParentDataPipelineTransparent	WordWrap	DataPipelineNameppDBCabmmHeightxmmLeft�5mmTopaImmWidthg_ BandType   	TppDBText
ppDBText25UserNamepdbtDIR2	DataFieldPROVDIRDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameRoman 12cpi	Font.Size
Font.Style ParentDataPipelineTransparent	WordWrap	DataPipelineNameppDBCabmmHeightxmmLeft�:mmToptjmmWidth<Z BandType   	TppDBText
ppDBText26UserNamepdbtCOD2	DataFieldPROVDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameRoman 12cpi	Font.Size
Font.Style ParentDataPipelineTransparent	WordWrap	DataPipelineNameppDBCabmmHeightxmmLeft�5mmTop��  mmWidthm�  BandType   	TppDBText
ppDBText27UserNamepdbtRUC2	DataFieldPROVRUCDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameRoman 12cpi	Font.Size
Font.Style ParentDataPipelineTransparent	WordWrap	DataPipelineNameppDBCabmmHeightxmmLeft�  mmTop��  mmWidthm�  BandType   	TppDBText
ppDBText28UserNamepdbtFAX2	DataFieldPROVFAXDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameRoman 12cpi	Font.Size
Font.Style ParentDataPipelineTransparent	WordWrap	DataPipelineNameppDBCabmmHeightxmmLeft�  mmTop��  mmWidthm�  BandType   	TppDBText
ppDBText29UserNamepdbtTLF2	DataFieldPROVTELFDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameRoman 12cpi	Font.Size
Font.Style ParentDataPipelineTransparent	WordWrap	DataPipelineNameppDBCabmmHeightxmmLeft�5mmTop��  mmWidthm�  BandType   	TppDBText
ppDBText31UserName	pdbtFENT2	DataFieldODCFATEDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameRoman 12cpi	Font.Size
Font.Style ParentDataPipelineTransparent	WordWrap	DataPipelineNameppDBCabmmHeightxmmLeftZ� mmTopaImmWidth]BandType   	TppDBText
ppDBText32UserName	pdbtLENT2	DataFieldLGECABRDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameRoman 12cpi	Font.Size
Font.Style ParentDataPipelineTransparent	WordWrap	DataPipelineNameppDBCabmmHeightxmmLeftZ� mmTop�zmmWidth`BandType   	TppDBText
ppDBText33UserNamepdbtMON2	DataFieldTMONABRDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameRoman 12cpi	Font.Size
Font.Style ParentDataPipelineTransparent	WordWrap	DataPipelineNameppDBCabmmHeightxmmLeftQ� mmTop��  mmWidth]BandType   	TppDBText
ppDBText34UserNamepdbtNUM2	DataFieldODCIDDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameRoman 12cpi	Font.Size
Font.Style ParentDataPipelineTransparent	WordWrap	DataPipelineNameppDBCabmmHeightxmmLeft� mmTop�8mmWidthm�  BandType   	TppDBText
ppDBText35UserNameDBText35	DataFieldODCFEMIDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameRoman 12cpi	Font.Size
Font.Style ParentDataPipelineTransparent	WordWrap	DataPipelineNameppDBCabmmHeightxmmLeft� mmTop�XmmWidth]BandType   	TppDBText
ppDBText36UserNameDBText36	DataField	CCOMERDESDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameRoman 12cpi	Font.Size
Font.Style ParentDataPipelineTransparent	WordWrap	DataPipelineNameppDBCabmmHeightxmmLeftPS mmTop��  mmWidth��  BandType   TppLabelppLabel8UserNameLabel8CaptionLabel8Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.Style Transparent	mmHeight"mmLeftQ� mmTopmmWidth�[BandType    TppDetailBandppDetailBand3BeforePrintppDetailBand3BeforePrint
PrintCountPrintHeight	phDynamicmmBottomOffset mmHeight�mmPrintPositionp  	TppDBText
ppDBText37UserNameDBText37	DataFieldARTIDDataPipelineppdbOCFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameRoman 12cpi	Font.Size
Font.Style Transparent	DataPipelineNameppdbOCmmHeightxmmLeft mmTop mmWidth%BBandType  	TppDBText
ppDBText39UserName	pdbUNMED2ReprintOnOverFlow		DataFieldUNMABRDataPipelineppdbOCFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameRoman 12cpi	Font.Size
Font.Style Transparent	DataPipelineNameppdbOCmmHeightxmmLeft� mmTop mmWidth�0BandType  	TppDBText
ppDBText40UserName	pdbtCANT2	DataFieldDODCCNTDataPipelineppdbOCDisplayFormat#,###,##0.00Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameRoman 12cpi	Font.Size
Font.Style TextAlignmenttaRightJustifiedTransparent	DataPipelineNameppdbOCmmHeightxmmLeft�� mmTop mmWidth%BBandType  	TppDBText
ppDBText41UserName
pdbtPUNIT2	DataFieldDODCPUNDataPipelineppdbOCDisplayFormat#,###,##0.0000Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameRoman 12cpi	Font.Size
Font.Style TextAlignmenttaRightJustifiedTransparent	DataPipelineNameppdbOCmmHeightxmmLeft�& mmTop mmWidth]BandType  	TppDBText
ppDBText42UserName
pdbtDSCTO2	DataField	DODCDSCTODataPipelineppdbOCDisplayFormat###,###,##0.00Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameRoman 12cpi	Font.Size
Font.Style TextAlignmenttaRightJustifiedTransparent	DataPipelineNameppdbOCmmHeightxmmLeftB� mmTop mmWidth?BandType  	TppDBText
ppDBText43UserNamepdbtIMPORT2	DataFieldDODCIMPDataPipelineppdbOCDisplayFormat###,###,##0.00Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameRoman 12cpi	Font.Size
Font.Style TextAlignmenttaRightJustifiedTransparent	DataPipelineNameppdbOCmmHeightxmmLeft�� mmTop mmWidthjJBandType  	TppDBMemo	ppDBMemo1UserNameDBMemo1CharWrap	DataFieldARTDESDataPipelineppdbOCFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameRoman 12cpi	Font.Size
Font.Style Stretch	Transparent	DataPipelineNameppdbOCmmHeightxmmLeftPGmmTop mmWidth�J BandTypemmBottomOffset mmOverFlowOffset mmStopPosition 	mmLeading   TppVariableppvLinUserNamevLin	CalcOrder Font.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size

Font.Style Transparent	VisiblemmHeightpmmLeft6� mmTop mmWidthgBandType  TppLabelppLabel9UserNameLabel9CaptionVAN...Font.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size

Font.Style Transparent	VisiblemmHeight�mmLeftHFmmTop mmWidthO(BandType  TppLabelppLabel7UserNameLabel7CaptionVIENENFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size

Font.Style Transparent	VisiblemmHeight�mmLeftHFmmTop mmWidth�1BandType   TppSummaryBandppSummaryBand3PrintHeight	phDynamicmmBottomOffset mmHeight�K mmPrintPosition��  	TppDBText
ppDBText44UserNameDBText44	DataFieldODCIXTCCDataPipelineppDBCabDisplayFormat###,###,##0.00Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameRoman 12cpi	Font.Size
Font.Style ParentDataPipelineTextAlignmenttaRightJustifiedTransparent	DataPipelineNameppDBCabmmHeightxmmLeft� mmTop�mmWidthchBandType  	TppDBText
ppDBText45UserNamedbtIGV2	DataField	ODCTTIMPUDataPipelineppDBCabDisplayFormat###,###,##0.00Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameRoman 12cpi	Font.Size
Font.Style ParentDataPipelineTextAlignmenttaRightJustifiedTransparent	DataPipelineNameppDBCabmmHeightxmmLeft>2 mmTop�mmWidthtjBandType  	TppDBText
ppDBText46UserNamepdbtIMPTOTAL2	DataField	ODCTOTALGDataPipelineppDBCabDisplayFormat###,###,##0.00Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameRoman 12cpi	Font.Size
Font.Style ParentDataPipelineTextAlignmenttaRightJustifiedTransparent	DataPipelineNameppDBCabmmHeightxmmLeft#� mmTop�mmWidth�ZBandType  	TppDBMemo	ppdbmObseUserNamedbmObseCharWrap		DataFieldODCOBSDataPipelineppDBCabFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size

Font.Style ParentDataPipelineStretch	Transparent	DataPipelineNameppDBCabmmHeight�mmLeft"mmTop?EmmWidth�1 BandTypemmBottomOffset mmOverFlowOffset mmStopPosition 	mmLeading   	TppDBText	ppDBText4UserNameDBText4	DataFieldTMONABRDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameRoman 12cpi	Font.Size
Font.Style ParentDataPipelineTransparent	WordWrap	DataPipelineNameppDBCabmmHeightxmmLeft;� mmTop�mmWidth�BandType    	TppReportpprOCPEAutoStopDataPipelineppdbOCOnStartPagepprOCPEStartPagePrinterSetup.BinNameDefaultPrinterSetup.DocumentNamerOCPEPrinterSetup.PaperNameA4PrinterSetup.PrinterNameDefaultPrinterSetup.mmMarginBottom^PrinterSetup.mmMarginLeft^PrinterSetup.mmMarginRight^PrinterSetup.mmMarginTop^PrinterSetup.mmPaperHeight(� PrinterSetup.mmPaperWidthP4 PrinterSetup.PaperSize	Template.FileName%C:\DemaExes\RTMS\LOG\Dema\OrdComp.rtmTemplate.SaveTo
stDatabaseUnitsutMillimeters
DeviceTypeScreenOnPreviewFormCreatepprOCPEPreviewFormCreateOutlineSettings.CreateNode	OutlineSettings.CreatePageNodes	OutlineSettings.EnabledOutlineSettings.Visible TextSearchSettings.DefaultString
<FindText>TextSearchSettings.EnabledLeft�Top� Version7.02mmColumnWidth DataPipelineNameppdbOC TppHeaderBandppHeaderBand4BeforePrintppHeaderBand4BeforePrintPrintHeight	phDynamicmmBottomOffset mmHeight}$ mmPrintPosition  TppShape	ppShape10UserNameShape10ShapestRoundRectmmHeight��  mmLeft� mmTop�/mmWidth�xBandType   TppShapeppShape7UserNameShape7Brush.ColorclSilver	Pen.StylepsClearmmHeight�mmLeft�mmTop� mmWidthb BandType   TppShapeppShape8UserNameShape8ShapestRoundRectmmHeight�;mmLeft
, mmTop��  mmWidth��  BandType   TppShapeppShape9UserNameShape9	Pen.WidthShapestRoundRectmmHeightԔ  mmLeft+ mmTopO(mmWidth��  BandType   TppShape	ppShape11UserNameShape11ShapestRoundRectmmHeight~�  mmLeft�mmTop�zmmWidth� BandType   	TppDBText
ppDBText49UserNameDBText49	DataFieldPROVDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.Style ParentDataPipelineTransparent	WordWrap	DataPipelineNameppDBCabmmHeightxmmLeft8cmmTop�  mmWidthm�  BandType   	TppDBText
ppDBText50UserNameDBText50	DataFieldPROVRUCDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.Style ParentDataPipelineTransparent	WordWrap	DataPipelineNameppDBCabmmHeightxmmLeft' mmTop�  mmWidth��  BandType   	TppDBText
ppDBText51UserNameDBText51	DataFieldPROVFAXDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.Style ParentDataPipelineTransparent	WordWrap	DataPipelineNameppDBCabmmHeightxmmLeft' mmTop��  mmWidth~�  BandType   	TppDBText
ppDBText52UserNameDBText52	DataFieldPROVTELFDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.Style ParentDataPipelineTransparent	WordWrap	DataPipelineNameppDBCabmmHeightxmmLeft8cmmTop��  mmWidthm�  BandType   	TppDBText
ppDBText54UserNameDBText54	DataFieldODCFATEDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.Style ParentDataPipelineTextAlignment
taCenteredTransparent	WordWrap	DataPipelineNameppDBCabmmHeightxmmLeftZ� mmTopS�  mmWidth]BandType   	TppDBText
ppDBText55UserNameDBText55	DataFieldLGECABRDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.Style ParentDataPipelineTransparent	WordWrap	DataPipelineNameppDBCabmmHeightxmmLeft� mmTop��  mmWidth]BandType   	TppDBText
ppDBText57UserNameDBText57	DataFieldODCIDDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size	
Font.Style ParentDataPipelineTransparent	WordWrap	DataPipelineNameppDBCabmmHeight�mmLeft� mmTopRfmmWidth�YBandType   	TppDBText
ppDBText58UserNameDBText58AutoSize		DataFieldODCFEMIDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.Style ParentDataPipelineTransparent	DataPipelineNameppDBCabmmHeight�mmLeft� mmTopS�  mmWidth%BBandType   	TppDBText
ppDBText59UserNameDBText59	DataField	CCOMERDESDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.Style ParentDataPipelineTransparent	WordWrap	DataPipelineNameppDBCabmmHeightxmmLeft�D mmTopO�  mmWidth��  BandType   TppLabel	ppLabel30UserNameLabel30Caption   SEÑORESFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.StylefsBold Transparent	mmHeightxmmLeft�mmTopS�  mmWidth�2BandType   TppLabel	ppLabel31UserNameLabel31Caption
   DIRECCIÓNFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.StylefsBold Transparent	mmHeightxmmLeft�mmTop*�  mmWidthABandType   TppLabel	ppLabel32UserNameLabel32CaptionCODIGOFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.StylefsBold Transparent	mmHeightxmmLeft�mmTop�  mmWidthi+BandType   TppLabel	ppLabel33UserNameLabel33CaptionR.U.CFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.StylefsBold Transparent	mmHeightxmmLeft��  mmTop�  mmWidth,$BandType   TppLabel	ppLabel34UserNameLabel34CaptionTELEFONOFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.StylefsBold Transparent	mmHeightxmmLeft�mmTop��  mmWidth�9BandType   TppLabel	ppLabel35UserNameLabel35CaptionFAXFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.StylefsBold Transparent	mmHeightxmmLeft�  mmTop��  mmWidth�BandType   TppLineppLine9UserNameLine9Weight       ��?mmHeight	mmLeft� mmTopHFmmWidth�wBandType   TppLineppLine10UserNameLine10Weight       ��?mmHeight	mmLeft� mmTop�nmmWidth�wBandType   TppLineppLine11UserNameLine11Weight       ��?mmHeight	mmLeft� mmTop:�  mmWidth�wBandType   TppLineppLine12UserNameLine12Weight       ��?mmHeight	mmLeft� mmTop�  mmWidth�wBandType   TppLineppLine13UserNameLine13Weight       ��?mmHeight	mmLeft� mmTopw�  mmWidth�wBandType   TppLineppLine14UserNameLine14Weight       ��?mmHeight	mmLeft�� mmTop+�  mmWidth�wBandType   TppLineppLine15UserNameLine15Weight       ��?mmHeight	mmLeft�� mmTop��  mmWidth�wBandType   TppLabel	ppLabel36UserNameLabel36Caption   NºFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size

Font.StylefsBold Transparent	mmHeight�mmLeftAp mmTopRfmmWidth�BandType   TppLabel	ppLabel37UserNameLabel37CaptionFECHAFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.StylefsBold Transparent	mmHeightxmmLeft�\ mmTopS�  mmWidth,$BandType   TppLabelpplReqUserNamelReqCaption   REQUISICIÓNFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.StylefsBold Transparent	mmHeightgmmLeft�� mmTop�4mmWidth�HBandType   TppLabel	ppLabel39UserNameLabel102CaptionFECHA DE ENTREGAFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.StylefsBold Transparent	mmHeightxmmLeft� mmTop�rmmWidth�sBandType   TppLabel	ppLabel40UserNameLabel40CaptionLUGAR DE ENTREGAFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.StylefsBold Transparent	mmHeightxmmLeft� mmTop��  mmWidth�sBandType   TppLabel	ppLabel41UserNameLabel41CaptionMONEDAFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.StylefsBold Transparent	mmHeightxmmLeft9� mmTop=�  mmWidthi+BandType   TppLineppLine16UserNameLine16Weight       ��?mmHeight	mmLeft
, mmTop6�  mmWidth��  BandType   TppLabel	ppLabel42UserNameLabel42CaptionORDEN DE COMPRAFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size
Font.StylefsBold Transparent	mmHeight�mmLefti7 mmTop>mmWidth��  BandType   TppLabelpplCiaUserNamelCiaAutoSizeCaptionBAZAR Y REPRESENTACIONESFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size
Font.StylefsBold Transparent	mmHeightKmmLeft�mmTop>&mmWidth� BandType   TppLabel	ppLabel46UserNameLabel46CaptionCODIGOFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.StylefsBold TextAlignment
taCenteredTransparent	mmHeightxmmLeftz-mmTop� mmWidthi+BandType   TppLabel	ppLabel47UserNameLabel47CaptionD E S C R I P C I O N Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.StylefsBold TextAlignment
taCenteredTransparent	mmHeightxmmLeftp�  mmTop� mmWidth*�  BandType   TppLabel	ppLabel48UserNameLabel48CaptionU.M.Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.StylefsBold TextAlignment
taCenteredTransparent	mmHeightxmmLeft�� mmTop� mmWidth�BandType   TppLabel	ppLabel49UserNameLabel202CaptionCANT.Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.StylefsBold TextAlignment
taCenteredTransparent	mmHeightxmmLeft� mmTop� mmWidth,$BandType   TppLabel	ppLabel50UserNameLabel50CaptionPRECIO UNIT.Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.StylefsBold TextAlignment
taCenteredTransparent	mmHeightxmmLeftq8 mmTop� mmWidth�VBandType   TppLabel	ppLabel51UserNameLabel51CaptionDSCTO.%Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.StylefsBold TextAlignment
taCenteredTransparent	mmHeightxmmLeft~� mmTop� mmWidth�2BandType   TppLabel	ppLabel52UserNameLabel52CaptionIMPORTEFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.StylefsBold TextAlignment
taCenteredTransparent	mmHeightxmmLeft$� mmTop� mmWidth�2BandType   TppLabel	ppLabel53UserNameLabel53Caption   RUC NºFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size
Font.Style TextAlignment
taCenteredTransparent	mmHeightxmmLeft�mmTopchmmWidth5%BandType   TppLabel	ppLabel54UserNameLabel54CaptionCONDICIONES DE PAGOFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.StylefsBold Transparent	mmHeightxmmLeft�e mmTop��  mmWidthv�  BandType   	TppDBText
ppDBText70UserNameDBText1	DataFieldCIADESDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size
Font.StylefsBold ParentDataPipelineTransparent	VisibleDataPipelineNameppDBCabmmHeight�mmLeft�2 mmTop^mmWidth�o BandType   	TppDBText
ppDBText71UserNameDBText2	DataFieldCIADIREDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size

Font.Style ParentDataPipelineTransparent	DataPipelineNameppDBCabmmHeight�mmLeft�mmTop?EmmWidth�n BandType   	TppDBText	ppDBText1UserName	DBText501	DataFieldCIARUCDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size
Font.Style ParentDataPipelineTransparent	WordWrap	DataPipelineNameppDBCabmmHeightxmmLeftPGmmTopchmmWidth�NBandType   TppLabelppLblciatlfUserName	LblciatlfCaptionTelf. Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size
Font.Style Transparent	mmHeightxmmLeft�mmTop�WmmWidth�BandType   	TppDBTextppDBTCiatlfUserName	DBTCiatlf	DataFieldCIATLFDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size
Font.Style ParentDataPipelineTransparent	DataPipelineNameppDBCabmmHeightxmmLeft�9mmTop�WmmWidthf�  BandType   TppLabelppLblciafaxUserName	LblciafaxCaption - Fax Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size
Font.Style Transparent	mmHeightxmmLeft��  mmTop�WmmWidth
 BandType   	TppDBTextppDBTciafaxUserName	DBTciafax	DataFieldCIAFAXDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size
Font.Style ParentDataPipelineTransparent	DataPipelineNameppDBCabmmHeightxmmLeft� mmTop�WmmWidth:�  BandType   	TppDBText	ppDBText5UserNameDBText5	DataFieldPROVDESDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.Style ParentDataPipelineTransparent	DataPipelineNameppDBCabmmHeightxmmLeft8cmmTopS�  mmWidthnA BandType   	TppDBText	ppDBText6UserNameDBText6	DataFieldPROVDIRDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.Style ParentDataPipelineTransparent	DataPipelineNameppDBCabmmHeightxmmLeft8cmmTop*�  mmWidthnA BandType   TppLabelppLabel1UserNameLabel1CaptionCONTACTOFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.StylefsBold Transparent	mmHeightxmmLeft�mmTop��  mmWidth�9BandType   	TppDBText	ppDBText7UserNameDBText7	DataFieldPROVREPRDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.Style ParentDataPipelineTransparent	DataPipelineNameppDBCabmmHeightxmmLeft8cmmTop��  mmWidthvB BandType   TppLineppLine1UserNameLine4Weight       ��?mmHeight	mmLeft� mmTopX�  mmWidth�wBandType   TppLabelppLabel2UserNameLabel12CaptionTIPO CAMBIOFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.StylefsBold Transparent	mmHeightxmmLeft�� mmTopi�  mmWidth�OBandType   TppLineppLine2UserNameLine5Weight       ��?mmHeight	mmLeft� mmTop��  mmWidth�wBandType   	TppDBText	ppDBText2UserNameDBText8	DataFieldODCTCAMBDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size	
Font.StylefsBold ParentDataPipelineTextAlignment
taCenteredTransparent	DataPipelineNameppDBCabmmHeight�mmLeft�� mmTop��  mmWidth.CBandType   	TppDBText	ppDBText3UserNameDBText9	DataFieldTMONABRDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size	
Font.StylefsBold ParentDataPipelineTextAlignment
taCenteredTransparent	DataPipelineNameppDBCabmmHeight�mmLeft�� mmTop��  mmWidth.CBandType   TppLabelpplReq1UserNameLabel2Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.Style mmHeightmmLeft/� mmTopsKmmWidthM.BandType   TppLabelppLabel3UserNameLabel13CaptionT.CompraFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.StylefsBold Transparent	mmHeightgmmLeft51 mmTop2�  mmWidth�4BandType   TppLabelppLabel4UserNameLabel20CaptionSOLIC. COMPRA ARTICULOSFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.Style Transparent	mmHeightgmmLeft�g mmTop2�  mmWidth��  BandType   	TppDBText
ppDBText56UserNameDBText10	DataFieldODCESTDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size
Font.StylefsBold ParentDataPipelineTextAlignment
taCenteredTransparent	VisibleDataPipelineNameppDBCabmmHeight�mmLeft,0 mmTop�pmmWidthr�  BandType   TppLabelpplReq2UserNamelReq1Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.Style mmHeightmmLeft� mmTopsKmmWidthM.BandType   TppLabelpplReq3UserNameLabel7Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.Style mmHeightmmLeft/� mmTop]mmWidthM.BandType   TppLabelpplReq4UserNamelReq4Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.Style mmHeightxmmLeft� mmTop]mmWidth�BandType   TppLabel
pplDerramaUserNameLabel8CaptionDERRAMA MAGISTERIALFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size
Font.StylefsBold Transparent	mmHeightmmLeft�mmToppmmWidthy�  BandType   	TppDBText
ppDBText60UserNameDBText11	DataFieldPROFIDDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.Style ParentDataPipelineTextAlignment
taCenteredTransparent	WordWrap	DataPipelineNameppDBCabmmHeightxmmLeft� mmTop�RmmWidth�oBandType    TppDetailBandppDetailBand4BeforePrintppDetailBand4BeforePrintPrintHeight	phDynamicmmBottomOffset mmHeight�mmPrintPosition�$  	TppDBText
ppDBText62UserNameDBText60	DataFieldARTIDDataPipelineppdbOCFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.Style ParentDataPipelineTransparent	DataPipelineNameppdbOCmmHeightxmmLeft�mmTop mmWidthRfBandType  	TppDBText
ppDBText63UserNameDBText62	DataFieldUNMABRFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.Style ParentDataPipelineTransparent	mmHeightxmmLeftb� mmTop mmWidth'BandType  	TppDBText
ppDBText64UserNameDBText63	DataFieldDODCCNTDataPipelineppdbOCDisplayFormat### ###,###.#0Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.Style ParentDataPipelineTextAlignmenttaRightJustifiedTransparent	DataPipelineNameppdbOCmmHeightxmmLeft�� mmTop mmWidthPFBandType  	TppDBText
ppDBText65UserNameDBText64	DataFieldDODCPUNDataPipelineppdbOCDisplayFormat###,###,###.00000Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.Style ParentDataPipelineTextAlignmenttaRightJustifiedTransparent	DataPipelineNameppdbOCmmHeightxmmLeft,0 mmTop mmWidth^BandType  	TppDBText
ppDBText66UserNameDBText65	DataField	DODCDSCTODataPipelineppdbOCDisplayFormat###,###,###.00Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.Style ParentDataPipelineTextAlignmenttaRightJustifiedTransparent	DataPipelineNameppdbOCmmHeightxmmLeftB� mmTop mmWidth�2BandType  	TppDBText
ppDBText67UserNameDBText66	DataFieldDODCIMPDataPipelineppdbOCDisplayFormat###,###,###.00000Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.Style ParentDataPipelineTextAlignmenttaRightJustifiedTransparent	DataPipelineNameppdbOCmmHeightxmmLeft�� mmTop mmWidth�XBandType  	TppDBMemo	ppDBMemo2UserNameDBMemo2CharWrap	DataFieldARTDESDataPipelineppdbOCFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.Style ParentDataPipelineStretch	Transparent	DataPipelineNameppdbOCmmHeight�mmLeft1�  mmTop mmWidth�1 BandTypemmBottomOffset mmOverFlowOffset mmStopPosition 	mmLeading   TppLabel	ppLabel10UserNameLabel10CaptionVAN...Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier	Font.Size
Font.Style Transparent	VisiblemmHeightpmmLeft:�  mmTop mmWidth�1BandType  TppLabel	ppLabel11UserNameLabel11CaptionVIENENFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier	Font.Size
Font.Style Transparent	VisiblemmHeightpmmLeft:�  mmTop mmWidth�1BandType   TppFooterBandppFooterBand4mmBottomOffset mmHeight�tmmPrintPosition  TppLabelppLabel5UserNameLabel4Caption
Hecho por:Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.Style Transparent	mmHeightxmmLeft~mmTop,$mmWidthYHBandType  TppLabelppLabel6UserNameLabel5CaptionVisado por:Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.Style Transparent	mmHeightxmmLeftu mmTop,$mmWidth�OBandType  TppLabel	ppLabel38UserNameLabel6Caption   Vº BºFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.Style Transparent	mmHeightxmmLeft�� mmTop,$mmWidth,$BandType  TppLineppLine3UserNameLine1Weight       ��?mmHeight	mmLeft.CmmTop
 mmWidth�  BandType  TppLineppLine23UserNameLine2Weight       ��?mmHeight	mmLeftT> mmTop
 mmWidth�  BandType  TppLineppLine24UserNameLine3Weight       ��?mmHeight	mmLefti7 mmTop
 mmWidth�  BandType  	TppDBText
ppDBText68UserNameDBText3	DataFieldUSUARIODataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.Style ParentDataPipelineTextAlignment
taCenteredTransparent	WordWrap	DataPipelineNameppDBCabmmHeightxmmLeft.CmmTopEmmWidth�  BandType  	TppDBText
ppDBText69UserNameDBText4	DataFieldVISADODataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.Style ParentDataPipelineTextAlignment
taCenteredTransparent	WordWrap	DataPipelineNameppDBCabmmHeightxmmLeft3Y mmTopV
mmWidthm�  BandType  TppSystemVariableppSystemVariable1UserNameSystemVariable1VarType	vtPageSetFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size
Font.Style Transparent	mmHeightxmmLeft�mmTopW)mmWidthBandType   TppSummaryBandppSummaryBand1PrintHeight	phDynamicmmBottomOffset mmHeight%BmmPrintPosition  TppShape	ppShape12UserNameShape12Brush.ColorclSilver	Pen.StylepsClearmmHeight�mmLeft mmTop	mmWidth$ BandType  	TppDBText
ppDBText75UserNameDBText67	DataFieldODCTOTALISCDataPipelineppDBCabDisplayFormat###,###,###.00000Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.Style ParentDataPipelineTextAlignmenttaRightJustifiedTransparent	DataPipelineNameppDBCabmmHeightxmmLeftK mmTop�mmWidth�SBandType  	TppDBText
ppDBText76UserNameDBText68	DataField	ODCTOTALGDataPipelineppDBCabDisplayFormat###,###,###.00000Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.Style ParentDataPipelineTextAlignmenttaRightJustifiedTransparent	DataPipelineNameppDBCabmmHeightxmmLeft�� mmTop�mmWidth_BandType  TppLabel	ppLabel55UserNameLabel55Caption	SUB-TOTALFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.StylefsBold TextAlignment
taCenteredTransparent	mmHeightxmmLefty� mmTopmmWidthABandType  TppLabel	ppLabel56UserNameLabel56CaptionI.S.CFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.StylefsBold TextAlignment
taCenteredTransparent	mmHeightxmmLeft�z mmTopmmWidth,$BandType  TppLabel	ppLabel57UserNameLabel57CaptionIMPORTE TOTALFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.StylefsBold TextAlignment
taCenteredTransparent	mmHeightxmmLeft�� mmTopmmWidth^BandType  TppLabel	ppLabel58UserNameLabel58CaptionI.G.VFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.StylefsBold TextAlignment
taCenteredTransparent	mmHeightxmmLeft	 mmTopmmWidth,$BandType  	TppDBText
ppDBText77UserNameDBText69	DataField	ODCTTIMPUDataPipelineppDBCabDisplayFormat###,###,###.00000Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.Style ParentDataPipelineTextAlignmenttaRightJustifiedTransparent	DataPipelineNameppDBCabmmHeightxmmLeft�� mmTop�mmWidthjJBandType  	TppDBCalc	ppDBCalc2UserNameDBCalc2	DataFieldDODCIMPDataPipelineppdbOCDisplayFormat###,###,###.00000Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.Style TextAlignmenttaRightJustifiedTransparent	DataPipelineNameppdbOCmmHeightxmmLeft�g mmTop�mmWidth�YBandType  TppLabel	ppLabel44UserNameLabel3CaptionObservaciones :Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.Style Transparent	mmHeightxmmLeft�mmTop�.mmWidth�lBandType  	TppDBMemo	ppDBMemo3UserNameDBMemo3CharWrap	DataFieldODCOBSDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.Style ParentDataPipelineStretch	Transparent	DataPipelineNameppDBCabmmHeight�mmLeft��  mmTopz-mmWidth\� BandTypemmBottomOffset mmOverFlowOffset mmStopPosition 	mmLeading   	TppDBCalc	ppDBCalc1UserNameDBCalc1	DataField	DODCDSCTODataPipelineppdbOCDisplayFormat#,0.00000;-#,0.00000Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.Style TextAlignmenttaRightJustifiedTransparent	DataPipelineNameppdbOCmmHeightgmmLeft@�  mmTop�mmWidth.CBandType  TppLabel	ppLabel66UserNameLabel9Caption	DESCUENTOFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameCourier New	Font.Size
Font.StylefsBold TextAlignment
taCenteredTransparent	mmHeightgmmLeft| mmTopmmWidth�;BandType   TppParameterListppParameterList1   TppDBPipeline	ppdbOCDepUserNamedbOCDepLeft�Top�   	TppReportpprOCDepAutoStopDataPipeline	ppdbOCDepPrinterSetup.BinNameDefaultPrinterSetup.DocumentNamerOCPEPrinterSetup.PaperNameCartaPrinterSetup.PrinterNameDefaultPrinterSetup.mmMarginBottom^PrinterSetup.mmMarginLeft^PrinterSetup.mmMarginRight^PrinterSetup.mmMarginTop^PrinterSetup.mmPaperHeight�A PrinterSetup.mmPaperWidth�K PrinterSetup.PaperSizeTemplate.FileName2C:\SOLExes\SOLFormatos\Log\Incoresa\OrdCompDep.rtmUnitsutMillimeters
DeviceTypeScreenOnPreviewFormCreatepprOCDepPreviewFormCreateOutlineSettings.CreateNode	OutlineSettings.CreatePageNodes	OutlineSettings.EnabledOutlineSettings.Visible TextSearchSettings.DefaultString
<FindText>TextSearchSettings.EnabledLeft�Top� Version7.02mmColumnWidth DataPipelineName	ppdbOCDep TppHeaderBandppHeaderBand1PrintHeight	phDynamicmmBottomOffset mmHeight� mmPrintPosition  TppShapeppShape1UserNameShape1ShapestRoundRectmmHeight�6mmLeft.O mmTop��  mmWidth��  BandType   TppShapeppShape2UserNameShape101ShapestRoundRectmmHeight�  mmLeft|� mmTop�.mmWidth:�  BandType   TppShapeppShape3UserNameShape3Brush.ColorclSilver	Pen.StylepsClearmmHeight�mmLeft�mmTop��  mmWidth$ BandType   TppShapeppShape4UserNameShape4	Pen.WidthShapestRoundRectmmHeight�zmmLeft�E mmTop!mmWidth��  BandType   TppShapeppShape5UserNameShape5ShapestRoundRectmmHeight�vmmLeft`*mmTop�xmmWidth� BandType   	TppDBText	ppDBText8UserNameDBText8	DataFieldPROVDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.Style ParentDataPipelineTransparent	WordWrap	DataPipelineNameppDBCabmmHeightxmmLeft�vmmTop��  mmWidth\�  BandType   	TppDBText	ppDBText9UserName	DBText502	DataFieldPROVRUCDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.Style ParentDataPipelineTransparent	WordWrap	DataPipelineNameppDBCabmmHeightxmmLeft�+ mmTop��  mmWidthm�  BandType   	TppDBText
ppDBText10UserNameDBText10	DataFieldPROVFAXDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.Style ParentDataPipelineTransparent	WordWrap	DataPipelineNameppDBCabmmHeightxmmLeft�+ mmTop�  mmWidthm�  BandType   	TppDBText
ppDBText11UserNameDBText11	DataFieldPROVTELFDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.Style ParentDataPipelineTransparent	WordWrap	DataPipelineNameppDBCabmmHeightxmmLeft�vmmTop�  mmWidth\�  BandType   	TppDBText
ppDBText12UserNameDBText12	DataFieldODCFATEDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.Style ParentDataPipelineTextAlignment
taCenteredTransparent	WordWrap	DataPipelineNameppDBCabmmHeightxmmLeft�� mmTop�ymmWidth]BandType   	TppDBText
ppDBText13UserNameDBText13	DataFieldLGECABRDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.Style ParentDataPipelineTransparent	WordWrap	DataPipelineNameppDBCabmmHeightxmmLeft�� mmTop]�  mmWidth]BandType   	TppDBText
ppDBText14UserNameDBText14	DataFieldTMONABRDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.StylefsBold ParentDataPipelineTextAlignment
taCenteredTransparent	WordWrap	DataPipelineNameppDBCabmmHeightxmmLeft�� mmTop��  mmWidth]BandType   	TppDBText
ppDBText15UserNameDBText15	DataFieldODCIDDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.Style ParentDataPipelineTransparent	WordWrap	DataPipelineNameppDBCabmmHeightxmmLeftK� mmTop`mmWidthm�  BandType   	TppDBText
ppDBText16UserNameDBText16	DataFieldODCFEMIDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.Style ParentDataPipelineTransparent	WordWrap	DataPipelineNameppDBCabmmHeightxmmLeftK� mmTop mmWidth]BandType   TppLabel	ppLabel12UserNameLabel301Caption   SEÑORESFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.StylefsBold Transparent	mmHeight�mmLeft�2mmTopB�  mmWidth�8BandType   TppLabel	ppLabel13UserNameLabel13Caption
   DIRECCIÓNFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.StylefsBold Transparent	mmHeight�mmLeft�1mmTop��  mmWidth@BandType   TppLabel	ppLabel14UserNameLabel14CaptionCODIGOFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.StylefsBold Transparent	mmHeight�mmLeft�3mmTop��  mmWidth�.BandType   TppLabel	ppLabel15UserNameLabel15CaptionR.U.CFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.StylefsBold Transparent	mmHeight�mmLeftb mmTop��  mmWidthBandType   TppLabel	ppLabel16UserNameLabel16CaptionTELEFONOFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.StylefsBold Transparent	mmHeight�mmLeft�2mmTop�  mmWidth>BandType   TppLabel	ppLabel17UserNameLabel17CaptionFAXFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.StylefsBold Transparent	mmHeight�mmLeft� mmTop�  mmWidth�BandType   TppLineppLine4UserNameLine4Weight       ��?mmHeight	mmLeft�� mmTopHFmmWidth(�  BandType   TppLineppLine5UserNameLine101Weight       ��?mmHeight	mmLeft�� mmTop8cmmWidth1�  BandType   TppLineppLine6UserNameLine6Weight       ��?mmHeight	mmLeft�� mmTop�tmmWidth1�  BandType   TppLineppLine7UserNameLine7Weight       ��?mmHeight	mmLeft�� mmTop��  mmWidth~BandType   TppLineppLine8UserNameLine8Weight       ��?mmHeight	mmLeft�� mmTopL�  mmWidth(�  BandType   TppLineppLine17UserNameLine17Weight       ��?mmHeight	mmLeft�� mmTop�  mmWidth~BandType   TppLineppLine18UserNameLine18Weight       ��?mmHeight	mmLeft�� mmTop��  mmWidth~BandType   TppLabel	ppLabel18UserNameLabel18Caption   NºFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size

Font.StylefsBold Transparent	mmHeight�mmLeftct mmTop`mmWidthxBandType   TppLabel	ppLabel19UserNameLabel19CaptionFECHAFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.StylefsBold Transparent	mmHeight�mmLeft�[ mmTop mmWidth>&BandType   TppLabel	ppLabel20UserNameLabel20Caption   REQUISICIÓNFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.StylefsBold Transparent	mmHeight�mmLeft9� mmTop�3mmWidth{LBandType   TppLabel	ppLabel21UserNameLabel21CaptionFECHA DE ENTREGAFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.StylefsBold Transparent	mmHeight�mmLeft�� mmTopIemmWidth�rBandType   TppLabel	ppLabel22UserNameLabel401CaptionLUGAR DE ENTREGAFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.StylefsBold Transparent	mmHeight�mmLeft�� mmTop��  mmWidth�tBandType   TppLabel	ppLabel23UserNameLabel23CaptionMONEDAFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.StylefsBold Transparent	mmHeight�mmLeft�� mmTop+�  mmWidth�3BandType   TppLabel	ppLabel24UserNameLabel24CaptionORDEN DE COMPRAFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size
Font.StylefsBold TextAlignment
taCenteredTransparent	WordWrap	mmHeight�mmLeft�G mmTop7DmmWidth��  BandType   TppLabel	ppLabel25UserNameLabel25AutoSizeCaption   Departamento de AdministraciónFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size
Font.Style Transparent	WordWrap	mmHeight�mmLefti+mmTopF'mmWidth�I BandType   TppLabel	ppLabel26UserNameLabel26CaptionCODIGOFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.StylefsBold TextAlignment
taCenteredTransparent	mmHeight�mmLeft@mmTop�  mmWidth�.BandType   TppLabel	ppLabel27UserNameLabel27CaptionD E S C R I P C I O N Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.StylefsBold TextAlignment
taCenteredTransparent	mmHeight�mmLeft�  mmTop�  mmWidth�rBandType   TppLabel	ppLabel28UserNameLabel28CaptionU.M.Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.StylefsBold TextAlignment
taCenteredTransparent	mmHeight�mmLeft�� mmTop�  mmWidth�BandType   TppLabel	ppLabel29UserNameLabel29CaptionCant. PedidaFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.StylefsBold TextAlignment
taCenteredTransparent	mmHeight�mmLeftg mmTop�  mmWidthaIBandType   TppLabel	ppLabel43UserNameLabel501CaptionCant. AtendidaFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.StylefsBold TextAlignment
taCenteredTransparent	mmHeight�mmLeftlu mmTop�  mmWidth�TBandType   TppLabel	ppLabel45UserNameLabel45CaptionCant. SaldoFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.StylefsBold TextAlignment
taCenteredTransparent	mmHeight�mmLeft�� mmTop�  mmWidth%BBandType   TppLabel	ppLabel59UserNameLabel59Caption   RUC NºFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.Style TextAlignment
taCenteredTransparent	mmHeight�mmLeft`*mmTopIemmWidthq,BandType   	TppDBText
ppDBText17UserNameDBText17	DataFieldCIADESDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size
Font.StylefsBold ParentDataPipelineTransparent	DataPipelineNameppDBCabmmHeight�mmLeft`*mmTop4mmWidth�� BandType   	TppDBText
ppDBText18UserNameDBText18	DataFieldCIADIREDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size

Font.Style ParentDataPipelineTransparent	DataPipelineNameppDBCabmmHeight�mmLefti+mmTop>mmWidth�n BandType   	TppDBText
ppDBText19UserNameDBText19	DataFieldCIARUCDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.Style ParentDataPipelineTransparent	WordWrap	DataPipelineNameppDBCabmmHeightxmmLeft�ZmmTopIemmWidth�NBandType   TppLabel	ppLabel60UserName
Lblciatlf1CaptionTelf. Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.Style Transparent	mmHeight�mmLefti+mmTop�QmmWidth�BandType   	TppDBText
ppDBText20UserName
DBTCiatlf1	DataFieldCIATLFDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.Style ParentDataPipelineTransparent	DataPipelineNameppDBCabmmHeight�mmLeft�MmmTop�QmmWidth{LBandType   TppLabel	ppLabel61UserName
Lblciafax1Caption - Fax Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.Style Transparent	mmHeight�mmLeft*�  mmTop�QmmWidth!BandType   	TppDBText
ppDBText22UserName
DBTciafax1	DataFieldCIAFAXDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.Style ParentDataPipelineTransparent	DataPipelineNameppDBCabmmHeight�mmLefty�  mmTop�QmmWidthı  BandType   	TppDBText
ppDBText23UserNameDBText23	DataFieldPROVDESDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.Style ParentDataPipelineTransparent	DataPipelineNameppDBCabmmHeight�mmLeft�vmmTopB�  mmWidthK= BandType   	TppDBText
ppDBText24UserNameDBText24	DataFieldPROVDIRDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.Style ParentDataPipelineTransparent	DataPipelineNameppDBCabmmHeight�mmLeft�vmmTop��  mmWidthK= BandType   TppLabel	ppLabel62UserNameLabel62CaptionCONTACTOFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.StylefsBold Transparent	mmHeight�mmLeft�2mmTop_�  mmWidth%BBandType   	TppDBText
ppDBText30UserNameDBText30	DataFieldPROVREPRDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.Style ParentDataPipelineTransparent	DataPipelineNameppDBCabmmHeight�mmLeft�vmmTop_�  mmWidthK= BandType   TppLabel	ppLabel63UserNameLabel63Caption.Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.Style Transparent	mmHeight�mmLeft�� mmTopYHmmWidthBandType   TppLineppLine19UserNameLine19Weight       ��?mmHeight	mmLeft7P mmTop#�  mmWidth��  BandType   TppLabel	ppLabel64UserNameLabel64CaptionCONDICIONES DE PAGOFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.StylefsBold Transparent	mmHeight�mmLeft�~ mmTop��  mmWidthv�  BandType   	TppDBText
ppDBText38UserNameDBText38	DataField	CCOMERDESDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.Style ParentDataPipelineTransparent	DataPipelineNameppDBCabmmHeight�mmLeft�c mmTopp�  mmWidth��  BandType   TppLabel	ppLabel65UserNameLabel65CaptionSALDOFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size
Font.StylefsBold Transparent	mmHeight�mmLefte� mmTopO(mmWidthsKBandType    TppDetailBandppDetailBand1
PrintCountPrintHeight	phDynamicmmBottomOffset mmHeight�mmPrintPositionp  	TppDBText
ppDBText47UserName	DBText601	DataFieldARTIDDataPipeline	ppdbOCDepFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.Style Transparent	DataPipelineName	ppdbOCDepmmHeight�mmLefti+mmTop	mmWidth�pBandType  	TppDBText
ppDBText48UserNameDBText48	DataFieldUNMABRDataPipeline	ppdbOCDepFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.Style Transparent	DataPipelineName	ppdbOCDepmmHeight�mmLeftu� mmTop	mmWidthF'BandType  	TppDBText
ppDBText53UserNameDBText53	DataFieldDODCCNTDataPipeline	ppdbOCDepDisplayFormat### ###,###.#0Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.Style TextAlignmenttaRightJustifiedTransparent	DataPipelineName	ppdbOCDepmmHeight�mmLeft< mmTop	mmWidth�VBandType  	TppDBText
ppDBText61UserNameDBText61	DataFieldDODCCATEDataPipeline	ppdbOCDepDisplayFormat###,###,###.###0Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.Style TextAlignmenttaRightJustifiedTransparent	DataPipelineName	ppdbOCDepmmHeight�mmLefttv mmTop	mmWidth�VBandType  	TppDBText
ppDBText72UserNameDBText72	DataFieldDODCCSLDDataPipeline	ppdbOCDepDisplayFormat###,###,###.###0Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.Style TextAlignmenttaRightJustifiedTransparent	DataPipelineName	ppdbOCDepmmHeight�mmLeft�� mmTop	mmWidth�VBandType  	TppDBMemo	ppDBMemo4UserNameDBMemo4CharWrap	DataFieldARTDESDataPipeline	ppdbOCDepFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.Style Stretch	Transparent	DataPipelineName	ppdbOCDepmmHeight�mmLeftD�  mmTop	mmWidth�1 BandTypemmBottomOffset mmOverFlowOffset mmStopPosition 	mmLeading    TppSummaryBandppSummaryBand2PrintHeight	phDynamicmmBottomOffset mmHeight#�  mmPrintPosition  TppLabel	ppLabel67UserNameLabel67CaptionObservaciones  :Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.Style Transparent	mmHeight�mmLeft�2mmTop�8mmWidth_BandType  	TppDBMemo	ppDBMemo5UserNameDBMemo5CharWrap	DataFieldODCOBSDataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.Style ParentDataPipelineStretch	Transparent	DataPipelineNameppDBCabmmHeightW)mmLeft��  mmTop�8mmWidthsW BandTypemmBottomOffset mmOverFlowOffset mmStopPosition 	mmLeading   TppLabel	ppLabel68UserNameLabel68Caption
Hecho por:Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.Style Transparent	mmHeight�mmLeft��  mmTop��  mmWidth>BandType  TppLabel	ppLabel69UserNameLabel69CaptionVisado por:Font.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.Style Transparent	mmHeight�mmLeft� mmTop��  mmWidth@BandType  TppLabel	ppLabel70UserNameLabel70Caption   Vº BºFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.Style Transparent	mmHeight�mmLeft� mmTop��  mmWidth�BandType  TppLineppLine20UserNameLine20Weight       ��?mmHeight	mmLeft_mmTop��  mmWidth�  BandType  TppLineppLine21UserNameLine21Weight       ��?mmHeight	mmLeft<Z mmTop��  mmWidth�  BandType  TppLineppLine22UserNameLine22Weight       ��?mmHeight	mmLeftPS mmTop��  mmWidth�  BandType  	TppDBText
ppDBText73UserNameDBText73	DataFieldUSUARIODataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.Style ParentDataPipelineTextAlignment
taCenteredTransparent	WordWrap	DataPipelineNameppDBCabmmHeightxmmLeft�vmmTop�ummWidthm�  BandType  	TppDBText
ppDBText74UserNameDBText74	DataFieldVISADODataPipelineppDBCabFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.Style ParentDataPipelineTextAlignment
taCenteredTransparent	WordWrap	DataPipelineNameppDBCabmmHeightxmmLeftu mmTop�wmmWidthm�  BandType  TppSystemVariableppSystemVariable2UserNameSystemVariable2VarType	vtPageSetFont.CharsetANSI_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size	
Font.Style Transparent	mmHeight�mmLeft?mmTopf�  mmWidth$#BandType     