object FMaestroServicios: TFMaestroServicios
  Left = 409
  Top = 60
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Maestro de Servicios'
  ClientHeight = 583
  ClientWidth = 434
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TLabel
    Left = 162
    Top = 76
    Width = 85
    Height = 13
    Caption = 'Cliente/Suministro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object gbDatosGenerales: TGroupBox
    Left = 9
    Top = 30
    Width = 414
    Height = 366
    Caption = 'Datos generales del servicio: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object lblCia: TLabel
      Left = 7
      Top = 23
      Width = 49
      Height = 13
      Caption = 'Compa'#241#237'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblLocal: TLabel
      Left = 207
      Top = 23
      Width = 26
      Height = 13
      Caption = 'Local'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblCliente: TLabel
      Left = 169
      Top = 149
      Width = 85
      Height = 13
      Caption = 'Cliente/Suministro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblNumServ: TLabel
      Left = 296
      Top = 149
      Width = 95
      Height = 13
      Caption = 'Numero del Servicio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblDireccion: TLabel
      Left = 7
      Top = 66
      Width = 94
      Height = 13
      Caption = 'Direcci'#243'n del Local '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblProveedor: TLabel
      Left = 7
      Top = 229
      Width = 107
      Height = 13
      Caption = 'Proveedor del Servicio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblTipServicio: TLabel
      Left = 7
      Top = 148
      Width = 62
      Height = 13
      Caption = 'Tipo Servicio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblPropietario: TLabel
      Left = 10
      Top = 107
      Width = 50
      Height = 13
      Caption = 'Propietario'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblTitular: TLabel
      Left = 4
      Top = 318
      Width = 199
      Height = 13
      Caption = 'Titular del Servicio (quien paga el servicio)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblDescripAbrev: TLabel
      Left = 8
      Top = 188
      Width = 190
      Height = 16
      Caption = 'Descripci'#243'n Abreviada Servicio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 6
      Top = 275
      Width = 77
      Height = 13
      Caption = 'Clase de Auxiliar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object dblcCIA: TwwDBLookupCombo
      Left = 7
      Top = 37
      Width = 49
      Height = 24
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'C'#243'digo'#9'F'
        'CIADES'#9'40'#9'Descripci'#243'n'#9'F'
        'CIAABR'#9'15'#9'Abreviatura'#9'F')
      LookupField = 'CIAID'
      Options = [loColLines, loTitles]
      DropDownCount = 15
      MaxLength = 2
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
      OnChange = dblcCIAChange
      OnExit = dblcCIAExit
    end
    object edtCia: TEdit
      Left = 59
      Top = 37
      Width = 133
      Height = 24
      Color = 13825527
      Enabled = False
      TabOrder = 1
    end
    object dblcLOC: TwwDBLookupCombo
      Left = 207
      Top = 37
      Width = 49
      Height = 24
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'LOCID'#9'2'#9'C'#243'digo'#9'F'
        'LOCDES'#9'30'#9'Descripci'#243'n'#9'F'
        'LOCABR'#9'10'#9'Abreviatura'#9'F')
      LookupField = 'LOCID'
      Options = [loColLines, loTitles]
      MaxLength = 2
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
      OnChange = dblcLOCChange
      OnExit = dblcLOCExit
    end
    object edtLoc: TEdit
      Left = 258
      Top = 37
      Width = 136
      Height = 24
      Color = 13825527
      Enabled = False
      TabOrder = 3
    end
    object edtCliSuministro: TEdit
      Left = 167
      Top = 162
      Width = 122
      Height = 24
      TabOrder = 8
      OnExit = edtCliSuministroExit
    end
    object EdtDireccion: TEdit
      Left = 8
      Top = 81
      Width = 386
      Height = 24
      Color = 13825527
      Enabled = False
      TabOrder = 4
    end
    object edtProvServicio: TEdit
      Left = 74
      Top = 244
      Width = 320
      Height = 24
      Color = 13825527
      Enabled = False
      TabOrder = 12
    end
    object dblcTipServicio: TwwDBLookupCombo
      Left = 7
      Top = 162
      Width = 49
      Height = 24
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'C'#243'digo'#9'F'
        'CIADES'#9'40'#9'Descripci'#243'n'#9'F'
        'CIAABR'#9'15'#9'Abreviatura'#9'F')
      Options = [loColLines, loTitles]
      DropDownCount = 15
      MaxLength = 2
      TabOrder = 6
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
      OnChange = dblcTipServicioChange
      OnExit = dblcTipServicioExit
    end
    object edtTipServicio: TEdit
      Left = 58
      Top = 162
      Width = 102
      Height = 24
      Color = 13825527
      Enabled = False
      TabOrder = 7
    end
    object EdtPropietario: TEdit
      Left = 8
      Top = 122
      Width = 386
      Height = 24
      Color = 13825527
      Enabled = False
      TabOrder = 5
    end
    object dblcTitServicio: TwwDBLookupComboDlg
      Left = 6
      Top = 334
      Width = 62
      Height = 24
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Titular del Servicio'
      MaxWidth = 0
      MaxHeight = 209
      SearchDelay = 1
      TabOrder = 13
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnChange = dblcTitServicioChange
      OnExit = dblcTitServicioExit
    end
    object EdtTitServicio: TEdit
      Left = 76
      Top = 333
      Width = 317
      Height = 24
      Color = 13825527
      Enabled = False
      TabOrder = 14
    end
    object edtNumServicio: TEdit
      Left = 297
      Top = 163
      Width = 97
      Height = 24
      CharCase = ecUpperCase
      TabOrder = 9
      OnExit = edtNumServicioExit
    end
    object dblcProvServ: TwwDBLookupComboDlg
      Left = 7
      Top = 246
      Width = 60
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      BorderStyle = bsNone
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Proveedor del Servicio'
      MaxWidth = 0
      MaxHeight = 209
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      Frame.Enabled = True
      Frame.FocusBorders = [efRightBorder, efBottomBorder]
      ParentFont = False
      TabOrder = 11
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnChange = dblcProvServChange
      OnExit = dblcProvServExit
    end
    object edtDescripcion: TEdit
      Left = 8
      Top = 203
      Width = 387
      Height = 24
      CharCase = ecUpperCase
      MaxLength = 30
      TabOrder = 10
      OnExit = edtDescripcionExit
    end
    object chkDerrama: TCheckBox
      Left = 207
      Top = 317
      Width = 204
      Height = 17
      Caption = 'Paga Derrama Magisterial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 15
      OnClick = chkDerramaClick
    end
    object dblcClaseAux: TwwDBLookupCombo
      Left = 7
      Top = 290
      Width = 49
      Height = 24
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'C'#243'digo'#9'F'
        'CIADES'#9'40'#9'Descripci'#243'n'#9'F'
        'CIAABR'#9'15'#9'Abreviatura'#9'F')
      Options = [loColLines, loTitles]
      DropDownCount = 15
      Enabled = False
      MaxLength = 2
      TabOrder = 16
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
      OnChange = dblcTipServicioChange
      OnExit = dblcTipServicioExit
    end
    object edtClaseAux: TEdit
      Left = 58
      Top = 290
      Width = 102
      Height = 24
      Color = 13825527
      Enabled = False
      TabOrder = 17
    end
  end
  object gbParametros: TGroupBox
    Left = 9
    Top = 395
    Width = 320
    Height = 67
    Caption = 'Parametros: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object lblSerRec: TLabel
      Left = 7
      Top = 24
      Width = 56
      Height = 39
      Caption = 'Servicio Recurrente: (S/N)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object lblTipInt: TLabel
      Left = 109
      Top = 24
      Width = 44
      Height = 26
      Caption = 'Tipo Intervalo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object lblNumInt: TLabel
      Left = 215
      Top = 24
      Width = 44
      Height = 26
      Caption = 'Numero Intervalo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object cbSerRecurr: TComboBox
      Left = 69
      Top = 24
      Width = 33
      Height = 24
      AutoDropDown = True
      AutoCloseUp = True
      ItemHeight = 16
      ItemIndex = 0
      TabOrder = 0
      Text = 'S'
      OnExit = cbSerRecurrExit
      Items.Strings = (
        'S'
        'N')
    end
    object cbTipIntervalo: TComboBox
      Left = 154
      Top = 26
      Width = 54
      Height = 24
      AutoDropDown = True
      ItemHeight = 16
      TabOrder = 1
      Text = 'Mes'
      Items.Strings = (
        'Diario'
        'Mensual'
        'Trimestral'
        'Anual')
    end
    object dbsNumIntervalo: TwwDBSpinEdit
      Left = 262
      Top = 26
      Width = 49
      Height = 24
      Increment = 1.000000000000000000
      MaxValue = 31.000000000000000000
      MinValue = 1.000000000000000000
      Value = 1.000000000000000000
      TabOrder = 2
      UnboundDataType = wwDefault
    end
  end
  object gbEstado: TGroupBox
    Left = 332
    Top = 395
    Width = 90
    Height = 67
    Caption = 'Estado: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object lblSerAct: TLabel
      Left = 5
      Top = 19
      Width = 41
      Height = 39
      Caption = 'Servicio Activo: (A/I)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object cbSerActivo: TComboBox
      Left = 46
      Top = 25
      Width = 33
      Height = 24
      ItemHeight = 16
      ItemIndex = 0
      TabOrder = 0
      Text = 'A'
      Items.Strings = (
        'A'
        'I')
    end
  end
  object chkCanAut: TCheckBox
    Left = 11
    Top = 520
    Width = 169
    Height = 17
    Caption = 'Cancelaci'#243'n Automatica'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object memoObservacion: TMemo
    Left = 7
    Top = 467
    Width = 413
    Height = 49
    Lines.Strings = (
      '')
    TabOrder = 4
  end
  object GroupBox3: TGroupBox
    Left = 291
    Top = -3
    Width = 125
    Height = 39
    Enabled = False
    TabOrder = 5
    object edtCodUnico: TEdit
      Left = 2
      Top = 9
      Width = 119
      Height = 28
      Color = 13825527
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object pnlConfirme: TPanel
    Left = 221
    Top = 224
    Width = 185
    Height = 49
    TabOrder = 6
    Visible = False
    object Shape1: TShape
      Left = 1
      Top = 1
      Width = 183
      Height = 15
      Align = alTop
      Brush.Color = clBlue
      Pen.Style = psClear
    end
    object lblConfirmaServicio: TLabel
      Left = 11
      Top = 1
      Width = 157
      Height = 13
      Caption = 'Confirme Cliente/Suministro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object edtConfirme: TEdit
      Left = 9
      Top = 19
      Width = 166
      Height = 21
      CharCase = ecUpperCase
      Color = 16444382
      TabOrder = 0
      OnExit = edtConfirmeExit
    end
  end
  object gbopciones: TGroupBox
    Left = 9
    Top = 537
    Width = 415
    Height = 42
    TabOrder = 7
    object Z2bbtnGraba: TBitBtn
      Left = 290
      Top = 7
      Width = 32
      Height = 32
      Hint = 'Grabar Requisici'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = Z2bbtnGrabaClick
      Glyph.Data = {
        8A010000424D8A01000000000000760000002800000017000000170000000100
        0400000000001401000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333303000077777777777770003300000078888888888880000300000
        0780088888888800003000000780088888888800003000000780088888888800
        0030000007888888888888000030000000000000000000000030000000000000
        0000000000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000
        FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF00
        00300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFF
        FFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000
        FFFFFFFFFFFFFF07703000009999999999999907703000009999999999999900
        0030300099999999999999000330}
    end
    object btnSalir: TBitBtn
      Left = 332
      Top = 10
      Width = 75
      Height = 28
      Caption = 'Salir'
      TabOrder = 1
      OnClick = btnSalirClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000000000000000000000000000000000003F00007F0000
        7F3F007F3F007F3F007F3F007F3F007F3F007F3F000000003F00007F00007F00
        007F00007F00003F00007F0000FF0000FF3F00FF7F00FF7F00FF7F00FF7F00FF
        7F00FF7F007F7F009F9F00BF0000FF0000FF0000FF00007F00007F0000FF0000
        FF0000FF3F00FF7F00FF7F00FF7F00FF7F00FF7F007F7F00BFBF00606000BF00
        00FF0000FF00007F00003F00007F00007F00007F00007F3F007F3F00FFBF00FF
        BF00FFBF007F7F00BFBF008080006060007F00007F00003F0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF000000FFFF00FFFF00FFFF007F7F00BFBF008080008080
        00404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000040404040
        40404040407F7F00BFBF00808000808000404040FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF2020000000008080808080808080807F7F00BFBF008080008080
        00404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F0060600060606080
        80808080807F7F009F9F00202020808000404040FFFFFFFFFFFF000000000000
        0000000000007F7F00DFDF006060006060608080807F7F009F9F003F3F3F8080
        00404040FFFFFFFFFFFF5F5F00BFBF00BFBF00BFBF00DFDF00FFFF00DFDF0060
        60006060607F7F00BFBF00808000808000404040FFFFFFFFFFFF7F7F00FFFF3F
        FFFF7FFFFF7FFFFF7FFFFFBFFFFF3F7F7F006060607F7F00BFBF008080008080
        00404040FFFFFFFFFFFF0000000000000000000000007F7F00FFFF3F7F7F0060
        60608080807F7F00BFBF00808000808000404040FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF7F7F007F7F006060608080808080807F7F3FBFBF008080008080
        00404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF20200000000080808080
        8080808080606060BFBF7F9F9F00808000404040FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF000000808080808080808080808080606060BFBF7F9F9F
        00404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000040404040
        40404040404040404040402020207F7F3F202020FFFFFFFFFFFF}
    end
    object BitBtn1: TBitBtn
      Left = 254
      Top = 9
      Width = 29
      Height = 30
      Hint = 'Nuevo'
      TabOrder = 2
      OnClick = BitBtn1Click
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000000000000000000000000000000000003F3F3F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
        7F7F7F7F7F7F7F3F3F3F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF7F7F7F3F3F3F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F3F3F3F}
    end
  end
  object chkmodifica: TCheckBox
    Left = 195
    Top = 28
    Width = 75
    Height = 17
    Caption = 'Modifica'
    TabOrder = 8
    OnClick = chkmodificaClick
  end
end
