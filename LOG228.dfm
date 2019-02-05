object FRegOrdCD: TFRegOrdCD
  Left = 445
  Top = 217
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Orden de Compra Directa'
  ClientHeight = 574
  ClientWidth = 799
  Color = 14869218
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object pnlCant: TPanel
    Left = 251
    Top = 117
    Width = 300
    Height = 281
    Color = 12904163
    TabOrder = 4
    Visible = False
    object Panel2: TPanel
      Left = 1
      Top = 239
      Width = 298
      Height = 41
      Align = alBottom
      Color = 12904163
      TabOrder = 2
      object bbtnAceptar: TBitBtn
        Left = 149
        Top = 7
        Width = 36
        Height = 27
        Default = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = bbtnAceptarClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
      object bbtnCerrar: TBitBtn
        Left = 197
        Top = 7
        Width = 36
        Height = 27
        Cancel = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = bbtnCerrarClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333000033338833333333333333333F333333333333
          0000333911833333983333333388F333333F3333000033391118333911833333
          38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
          911118111118333338F3338F833338F3000033333911111111833333338F3338
          3333F8330000333333911111183333333338F333333F83330000333333311111
          8333333333338F3333383333000033333339111183333333333338F333833333
          00003333339111118333333333333833338F3333000033333911181118333333
          33338333338F333300003333911183911183333333383338F338F33300003333
          9118333911183333338F33838F338F33000033333913333391113333338FF833
          38F338F300003333333333333919333333388333338FFF830000333333333333
          3333333333333333333888330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
    end
    object StaticText1: TStaticText
      Left = 1
      Top = 1
      Width = 298
      Height = 17
      Align = alTop
      Alignment = taCenter
      BorderStyle = sbsSunken
      Caption = 'Detalle de Registro de Requisiones'
      Color = clHighlight
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      TabOrder = 1
      TabStop = True
    end
    object dbgDOCxDrqs: TwwDBGrid
      Left = 5
      Top = 18
      Width = 291
      Height = 221
      DisableThemesInTitle = False
      Selected.Strings = (
        'ARTID'#9'13'#9'Articulo'
        'RQSID'#9'9'#9'Rqs.'
        'DODCCNT'#9'10'#9'Cantidad')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      OnCellChanged = dbgDOCxDrqsCellChanged
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = DMLOG.dsDODCxDRQS
      KeyOptions = [dgEnterToTab, dgAllowDelete]
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -11
      TitleFont.Name = 'Comic Sans MS'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
      OnExit = dbgDOCxDrqsExit
    end
  end
  object pnlRRA: TPanel
    Left = 80
    Top = 112
    Width = 649
    Height = 337
    Color = 10207162
    TabOrder = 3
    Visible = False
    object Bevel5: TBevel
      Left = 4
      Top = 16
      Width = 640
      Height = 283
      Shape = bsFrame
    end
    object pnlTitle5: TPanel
      Left = 1
      Top = 1
      Width = 647
      Height = 20
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'Requisiciones Relacionadas al Artículo'
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 613
      Top = 303
      Width = 30
      Height = 28
      Hint = 'Confirma Actualización'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BitBtn1Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object dbgReqxArt: TwwDBGrid
      Left = 9
      Top = 31
      Width = 629
      Height = 270
      DisableThemesInTitle = False
      Selected.Strings = (
        'RQSID'#9'14'#9'Nº Requisición'#9'F'
        'ARTID'#9'17'#9'Código Artículo'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = 10207162
      FixedCols = 0
      ShowHorzScrollBar = True
      Color = 15792632
      DataSource = DMLOG.dsDReqs
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      KeyOptions = [dgEnterToTab]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      TabOrder = 2
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
      UseTFields = False
    end
  end
  object pnlCabecera: TPanel
    Left = 0
    Top = 0
    Width = 799
    Height = 259
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 14869218
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Bevel1: TBevel
      Left = 7
      Top = 6
      Width = 784
      Height = 243
      Shape = bsFrame
    end
    object lblCia: TLabel
      Left = 17
      Top = 38
      Width = 49
      Height = 15
      Caption = 'Compañía'
    end
    object lblObs: TLabel
      Left = 17
      Top = 165
      Width = 151
      Height = 15
      Caption = 'Observaciones / Comentarios'
    end
    object lblTMon: TLabel
      Left = 337
      Top = 87
      Width = 66
      Height = 15
      Caption = 'Tipo Moneda'
    end
    object lblFEmi: TLabel
      Left = 17
      Top = 87
      Width = 73
      Height = 15
      Caption = 'Fecha Emisión'
    end
    object lblConCom: TLabel
      Left = 549
      Top = 87
      Width = 105
      Height = 15
      Caption = 'Condición Comercial'
    end
    object lblProf: TLabel
      Left = 270
      Top = 38
      Width = 87
      Height = 15
      Caption = 'Requerimiento(s)'
    end
    object lblFEnt: TLabel
      Left = 116
      Top = 87
      Width = 73
      Height = 15
      Caption = 'Fecha Entrega'
    end
    object lblFReg: TLabel
      Left = 372
      Top = 38
      Width = 91
      Height = 15
      Caption = 'Fecha de Registro'
    end
    object lblDEnt: TLabel
      Left = 213
      Top = 87
      Width = 40
      Height = 15
      Caption = 'Entrega'
    end
    object lblDVal: TLabel
      Left = 284
      Top = 88
      Width = 38
      Height = 15
      Caption = 'Validez'
    end
    object lblTCam: TLabel
      Left = 485
      Top = 87
      Width = 47
      Height = 15
      Caption = 'T.Cambio'
    end
    object lblProv: TLabel
      Left = 518
      Top = 39
      Width = 52
      Height = 15
      Caption = 'Proveedor'
    end
    object lblFle: TLabel
      Left = 219
      Top = 127
      Width = 34
      Height = 15
      Caption = 'I.Flete'
    end
    object lblNro: TLabel
      Left = 198
      Top = 38
      Width = 67
      Height = 15
      Caption = 'Nº O.Compra'
    end
    object TLabel
      Left = 592
      Top = 128
      Width = 59
      Height = 15
      Caption = '% Impuesto'
      Visible = False
    end
    object lblLEnt: TLabel
      Left = 19
      Top = 127
      Width = 87
      Height = 15
      Caption = 'Lugar de Entrega'
    end
    object lblTCom: TLabel
      Left = 296
      Top = 127
      Width = 79
      Height = 15
      Caption = 'Tipo de Compra'
    end
    object Label3: TLabel
      Left = 692
      Top = 87
      Width = 72
      Height = 15
      Caption = 'Fecha de Pago'
    end
    object Label2: TLabel
      Left = 253
      Top = 79
      Width = 31
      Height = 15
      Caption = '(Días)'
    end
    object Label6: TLabel
      Left = 472
      Top = 39
      Width = 43
      Height = 15
      Caption = 'Auxiliar'
    end
    object lblReferencia: TLabel
      Left = 134
      Top = 16
      Width = 61
      Height = 15
      Caption = 'Referencia:'
    end
    object dblcCIA: TwwDBLookupCombo
      Left = 16
      Top = 54
      Width = 45
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'ID'#9'F'
        'CIADES'#9'40'#9'Descripción'#9'F'
        'CIAABR'#9'15'#9'Abreviatura'#9'F')
      DataField = 'CIAID'
      DataSource = DMLOG.dsOrdComp
      LookupTable = DMLOG.cdsCIA
      LookupField = 'CIAID'
      Options = [loColLines, loTitles]
      DropDownCount = 15
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcdExits
      OnNotInList = dblcNotInList
    end
    object Z2bbtnOK: TBitBtn
      Left = 754
      Top = 212
      Width = 32
      Height = 28
      Hint = 'Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 23
      OnClick = Z2bbtnOKClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object dbmObs: TDBMemo
      Left = 16
      Top = 179
      Width = 736
      Height = 67
      DataField = 'ODCOBS'
      DataSource = DMLOG.dsOrdComp
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Courier'
      Font.Pitch = fpFixed
      Font.Style = []
      ParentFont = False
      TabOrder = 22
      OnKeyPress = dbmObsKeyPress
    end
    object dblcTMoneda: TwwDBLookupCombo
      Left = 332
      Top = 103
      Width = 38
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TMONID'#9'3'#9'ID'#9'F'
        'TMONDES'#9'30'#9'Moneda'#9'F'
        'TMONABR'#9'8'#9'Abreviatura'#9'F')
      DataField = 'TMONID'
      DataSource = DMLOG.dsOrdComp
      LookupTable = DMLOG.cdsTMoneda
      LookupField = 'TMONID'
      Options = [loColLines, loRowLines, loTitles]
      MaxLength = 1
      TabOrder = 12
      AutoDropDown = False
      ShowButton = True
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcdExits
    end
    object dbdtpFEmi: TwwDBDateTimePicker
      Left = 16
      Top = 103
      Width = 92
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'ODCFEMI'
      DataSource = DMLOG.dsOrdComp
      Epoch = 1950
      Enabled = False
      ShowButton = True
      TabOrder = 8
      DisplayFormat = 'dd/mm/yyyy'
      OnExit = dblcdExits
    end
    object dblcFPago: TwwDBLookupCombo
      Left = 544
      Top = 103
      Width = 43
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CCOMERID'#9'2'#9'ID'#9'F'
        'CCOMERDES'#9'30'#9'Condicion Comercial'#9'F')
      DataField = 'CCOMERID'
      DataSource = DMLOG.dsOrdComp
      LookupTable = DMLOG.cdsFPago
      LookupField = 'CCOMERID'
      Options = [loColLines, loTitles]
      DropDownCount = 15
      TabOrder = 15
      AutoDropDown = False
      ShowButton = True
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcdExits
    end
    object dedNProforma: TwwDBEdit
      Left = 270
      Top = 54
      Width = 101
      Height = 23
      CharCase = ecUpperCase
      DataField = 'NUMREQUSU'
      DataSource = DMLOG.dsOrdComp
      Enabled = False
      MaxLength = 40
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbdtpFAtt: TwwDBDateTimePicker
      Left = 114
      Top = 103
      Width = 92
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'ODCFATE'
      DataSource = DMLOG.dsOrdComp
      Epoch = 1950
      ShowButton = True
      TabOrder = 9
      DisplayFormat = 'dd/mm/yyyy'
    end
    object dbdtpFReg: TwwDBDateTimePicker
      Left = 372
      Top = 54
      Width = 93
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'ODCFREG'
      DataSource = DMLOG.dsOrdComp
      Epoch = 1950
      Enabled = False
      ShowButton = True
      TabOrder = 5
      DisplayFormat = 'dd/mm/yyyy'
    end
    object dbseEnt: TwwDBSpinEdit
      Left = 213
      Top = 103
      Width = 50
      Height = 23
      Increment = 1.000000000000000000
      MaxValue = 365.000000000000000000
      MinValue = 1.000000000000000000
      Value = 1.000000000000000000
      DataField = 'ODCTEN'
      DataSource = DMLOG.dsOrdComp
      MaxLength = 3
      TabOrder = 10
      UnboundDataType = wwDefault
    end
    object dbsbVal: TwwDBSpinEdit
      Left = 274
      Top = 103
      Width = 50
      Height = 23
      Increment = 1.000000000000000000
      MaxValue = 365.000000000000000000
      MinValue = 1.000000000000000000
      Value = 1.000000000000000000
      DataField = 'ODCVALID'
      DataSource = DMLOG.dsOrdComp
      MaxLength = 3
      TabOrder = 11
      UnboundDataType = wwDefault
    end
    object dbeTCambio: TwwDBEdit
      Left = 482
      Top = 103
      Width = 55
      Height = 23
      CharCase = ecUpperCase
      DataField = 'ODCTCAMB'
      DataSource = DMLOG.dsOrdComp
      TabOrder = 14
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcdProv: TwwDBLookupComboDlg
      Left = 517
      Top = 54
      Width = 57
      Height = 23
      CharCase = ecUpperCase
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taCenter
      Caption = 'Proveedores'
      MaxWidth = 0
      MaxHeight = 209
      DataField = 'PROV'
      DataSource = DMLOG.dsOrdComp
      LookupTable = DMLOG.cdsProv
      LookupField = 'PROV'
      TabOrder = 7
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnEnter = dblcdProvEnter
      OnExit = dblcdProvExit
    end
    object dbeFlete: TwwDBEdit
      Left = 219
      Top = 141
      Width = 70
      Height = 23
      CharCase = ecUpperCase
      DataField = 'ODCIXFLE'
      DataSource = DMLOG.dsOrdComp
      TabOrder = 19
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeNReg: TwwDBEdit
      Left = 198
      Top = 54
      Width = 69
      Height = 23
      CharCase = ecUpperCase
      Color = clInfoBk
      DataField = 'ODCID'
      DataSource = DMLOG.dsOrdComp
      MaxLength = 8
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = dbeNRegExit
    end
    object dbeImpuesto: TwwDBEdit
      Left = 416
      Top = 166
      Width = 17
      Height = 23
      CharCase = ecUpperCase
      DataField = 'ODCIXTI'
      Enabled = False
      TabOrder = 26
      UnboundDataType = wwDefault
      Visible = False
      WantReturns = False
      WordWrap = False
    end
    object dbrgTImpue: TDBRadioGroup
      Left = 373
      Top = 152
      Width = 28
      Height = 40
      Caption = 'Impuesto'
      Columns = 2
      DataField = 'ODCTIMP'
      Items.Strings = (
        'Detallado'
        'Total')
      TabOrder = 25
      Values.Strings = (
        'DETALLADO'
        'TOTAL')
      Visible = False
      OnChange = dbrgTImpueChange
    end
    object dblcLEntrega: TwwDBLookupCombo
      Left = 16
      Top = 141
      Width = 45
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'LGECID'#9'2'#9'Código'#9'F'
        'LGECDES'#9'40'#9'Descripción'#9'F'
        'LGECABR'#9'15'#9'Abreviatura'#9'F')
      DataField = 'LGECID'
      DataSource = DMLOG.dsOrdComp
      LookupTable = DMLOG.cdsLEntrega
      LookupField = 'LGECID'
      Options = [loColLines, loRowLines, loTitles]
      DropDownCount = 15
      TabOrder = 17
      AutoDropDown = False
      ShowButton = True
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcdExits
      OnNotInList = dblcNotInList
    end
    object Z2bbtnBorrar: TBitBtn
      Left = 754
      Top = 179
      Width = 32
      Height = 28
      Hint = 'Modificar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 24
      OnClick = Z2bbtnBorrarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      NumGlyphs = 2
    end
    object edtCIA: TEdit
      Left = 62
      Top = 54
      Width = 135
      Height = 23
      Enabled = False
      TabOrder = 1
    end
    object edtTMoneda: TEdit
      Left = 371
      Top = 103
      Width = 103
      Height = 23
      Enabled = False
      TabOrder = 13
    end
    object edtFPago: TEdit
      Left = 588
      Top = 103
      Width = 90
      Height = 23
      Enabled = False
      TabOrder = 16
    end
    object edtLEntrega: TEdit
      Left = 62
      Top = 141
      Width = 150
      Height = 23
      Enabled = False
      TabOrder = 18
    end
    object dblcTipoCompra: TwwDBLookupCombo
      Left = 293
      Top = 141
      Width = 44
      Height = 23
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TIPOADQ'#9'2'#9'Tipo de Compra'#9'F'
        'TIPADQDES'#9'30'#9'Descripción'#9'F')
      DataField = 'TIPOADQ'
      DataSource = DMLOG.dsOrdComp
      LookupTable = DMLOG.cdsTipSol
      LookupField = 'TIPOADQ'
      Options = [loColLines, loTitles]
      MaxLength = 2
      TabOrder = 20
      AutoDropDown = False
      ShowButton = True
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
      OnExit = dblcdExits
      OnNotInList = dblcNotInList
    end
    object edtTipoCompra: TEdit
      Left = 340
      Top = 141
      Width = 165
      Height = 23
      Enabled = False
      TabOrder = 21
    end
    object edtProv: TwwDBEdit
      Left = 573
      Top = 54
      Width = 201
      Height = 23
      CharCase = ecUpperCase
      DataField = 'PROVDES'
      DataSource = DMLOG.dsOrdComp
      Enabled = False
      MaxLength = 8
      TabOrder = 27
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBDateTimePicker1: TwwDBDateTimePicker
      Left = 686
      Top = 103
      Width = 92
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'FECPAG'
      DataSource = DMLOG.dsOrdComp
      Epoch = 1950
      ShowButton = True
      TabOrder = 29
      DisplayFormat = 'dd/mm/yyyy'
    end
    object dblcTipoAuxiliar: TwwDBLookupCombo
      Left = 472
      Top = 53
      Width = 41
      Height = 23
      DropDownAlignment = taLeftJustify
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 6
      AutoDropDown = True
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcTipoAuxiliarExit
    end
    object gbPagoServ: TGroupBox
      Left = 508
      Top = 174
      Width = 244
      Height = 69
      Caption = 'Para pago de Servicios Institucionales'
      Color = clInactiveCaption
      Enabled = False
      ParentColor = False
      TabOrder = 30
      Visible = False
      object Label7: TLabel
        Left = 4
        Top = 20
        Width = 27
        Height = 15
        Caption = 'Local'
      end
      object dblcLOC: TwwDBLookupCombo
        Left = 34
        Top = 17
        Width = 49
        Height = 23
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'LOCID'#9'2'#9'Código'#9'F'
          'LOCDES'#9'30'#9'Descripción'#9'F'
          'LOCABR'#9'10'#9'Abreviatura'#9'F')
        LookupField = 'LOCID'
        Options = [loColLines, loTitles]
        MaxLength = 2
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        ShowMatchText = True
        OnExit = dblcLOCExit
      end
      object dbServicio: TwwDBLookupComboDlg
        Left = 85
        Top = 17
        Width = 84
        Height = 23
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Lookup'
        MaxWidth = 0
        MaxHeight = 209
        LookupTable = DMLOG.cdsSerPend
        LookupField = 'KEYRECIBO'
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnExit = dbServicioExit
      end
      object edtServicio: TEdit
        Left = 34
        Top = 41
        Width = 202
        Height = 23
        Enabled = False
        TabOrder = 2
      end
      object edtImporte: TEdit
        Left = 172
        Top = 16
        Width = 64
        Height = 23
        Enabled = False
        TabOrder = 3
      end
    end
    object pnlColoca: TPanel
      Left = 513
      Top = 128
      Width = 259
      Height = 42
      Color = 14869218
      TabOrder = 28
      object lblUsu: TLabel
        Left = 7
        Top = 1
        Width = 40
        Height = 15
        Caption = 'Usuario'
      end
      object lblFec: TLabel
        Left = 176
        Top = 1
        Width = 30
        Height = 15
        Caption = 'Fecha'
      end
      object lblCol: TLabel
        Left = 53
        Top = 1
        Width = 56
        Height = 15
        Caption = 'Colocación'
      end
      object wwDBEdit1: TwwDBEdit
        Left = 4
        Top = 16
        Width = 163
        Height = 23
        DataField = 'OCCOLOCAC'
        DataSource = DMLOG.dsOrdComp
        Enabled = False
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit2: TwwDBEdit
        Left = 174
        Top = 15
        Width = 78
        Height = 23
        DataField = 'OCCOLOFREG'
        DataSource = DMLOG.dsOrdComp
        Enabled = False
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 32
      Width = 781
      Height = 9
      TabOrder = 31
    end
    object edtNumReferencia: TEdit
      Left = 199
      Top = 10
      Width = 105
      Height = 23
      Color = clInfoBk
      Enabled = False
      TabOrder = 32
    end
    object EdtDescripReferencia: TEdit
      Left = 308
      Top = 10
      Width = 474
      Height = 23
      Color = clInfoBk
      Enabled = False
      TabOrder = 33
    end
    object CbTipOrdCompra: TComboBox
      Left = 14
      Top = 11
      Width = 112
      Height = 23
      ItemHeight = 15
      TabOrder = 34
      Text = 'O.C. DIRECTA'
      OnExit = CbTipOrdCompraExit
      Items.Strings = (
        'O.C. DIRECTA'
        'O.C. COTIZACION'
        'O.C. REQUERIM')
    end
    object edtnumRequerimiento: TEdit
      Left = 271
      Top = 53
      Width = 99
      Height = 23
      TabOrder = 4
    end
  end
  object pnlDetalleG: TPanel
    Left = 1
    Top = 258
    Width = 792
    Height = 313
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'pnlDetalleG'
    Color = 14869218
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object bvlT: TBevel
      Left = 4
      Top = 228
      Width = 784
      Height = 44
      Shape = bsFrame
    end
    object Bevel2: TBevel
      Left = 7
      Top = 272
      Width = 779
      Height = 5
      Shape = bsTopLine
    end
    object TLabel
      Left = 603
      Top = 229
      Width = 43
      Height = 13
      AutoSize = False
      Caption = 'TOTAL'
      Color = clRed
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object TLabel
      Left = 498
      Top = 229
      Width = 87
      Height = 16
      Caption = 'Total Descuento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object TLabel
      Left = 89
      Top = 229
      Width = 72
      Height = 16
      Caption = 'Total Compra'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object TLabel
      Left = 191
      Top = 229
      Width = 60
      Height = 16
      Caption = 'Total Flete'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object TLabel
      Left = 293
      Top = 229
      Width = 82
      Height = 16
      Caption = 'Total Impuesto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object TLabel
      Left = 395
      Top = 229
      Width = 54
      Height = 16
      Caption = 'Total ISC'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object sbDisenoRep: TSpeedButton
      Left = 8
      Top = 240
      Width = 5
      Height = 22
      Flat = True
      OnClick = sbDisenoRepClick
    end
    object stxTitulo1: TStaticText
      Left = 2
      Top = 2
      Width = 788
      Height = 17
      Align = alTop
      Alignment = taCenter
      BorderStyle = sbsSunken
      Caption = 'Detalle de Registro de Orden de Compra'
      Color = clHighlight
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      TabOrder = 0
    end
    object pnlEstado: TPanel
      Left = 256
      Top = 277
      Width = 203
      Height = 32
      Color = cl3DLight
      TabOrder = 6
      object TLabel
        Left = 12
        Top = 7
        Width = 46
        Height = 16
        Caption = 'Estado:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btxtEstado: TDBText
        Left = 73
        Top = 7
        Width = 114
        Height = 21
        Alignment = taCenter
        DataField = 'ODCEST'
        DataSource = DMLOG.dsOrdComp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
    end
    object dbeTotal: TwwDBEdit
      Left = 604
      Top = 245
      Width = 99
      Height = 21
      CharCase = ecUpperCase
      DataField = 'ODCTOTALG'
      DataSource = DMLOG.dsOrdComp
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeTCompra: TwwDBEdit
      Left = 88
      Top = 245
      Width = 99
      Height = 21
      CharCase = ecUpperCase
      DataField = 'ODCIXTCC'
      DataSource = DMLOG.dsOrdComp
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      UnboundDataType = wwDefault
      UsePictureMask = False
      WantReturns = False
      WordWrap = False
    end
    object dbeTFlete: TwwDBEdit
      Left = 191
      Top = 245
      Width = 99
      Height = 21
      CharCase = ecUpperCase
      DataField = 'ODCIXFLE'
      DataSource = DMLOG.dsOrdComp
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      UnboundDataType = wwDefault
      UsePictureMask = False
      WantReturns = False
      WordWrap = False
    end
    object dbeTimpues: TwwDBEdit
      Left = 293
      Top = 245
      Width = 99
      Height = 21
      CharCase = ecUpperCase
      DataField = 'ODCTTIMPU'
      DataSource = DMLOG.dsOrdComp
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      UnboundDataType = wwDefault
      UsePictureMask = False
      WantReturns = False
      WordWrap = False
    end
    object Z2btnDesc: TButton
      Left = 498
      Top = 245
      Width = 19
      Height = 20
      Hint = 'Editar el contenido del Descuento'
      Caption = '>'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      TabStop = False
      OnClick = Z2btnDescClick
    end
    object dbeDesc: TwwDBEdit
      Left = 523
      Top = 245
      Width = 77
      Height = 21
      CharCase = ecUpperCase
      DataField = 'ODCIXTD'
      DataSource = DMLOG.dsOrdComp
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      UnboundDataType = wwDefault
      UsePictureMask = False
      WantReturns = False
      WordWrap = False
      OnExit = dbeDescExit
    end
    object dbeTotISC: TwwDBEdit
      Left = 395
      Top = 245
      Width = 99
      Height = 21
      CharCase = ecUpperCase
      DataField = 'ODCTOTALISC'
      DataSource = DMLOG.dsOrdComp
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      UnboundDataType = wwDefault
      UsePictureMask = False
      WantReturns = False
      WordWrap = False
    end
    object Z2bbtnRegresa: TBitBtn
      Left = 574
      Top = 278
      Width = 32
      Height = 31
      Hint = 'Modifica Datos de Cabecera'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      TabStop = False
      OnClick = Z2bbtnRegresaClick
      Glyph.Data = {
        9A050000424D9A05000000000000360000002800000014000000170000000100
        1800000000006405000000000000000000000000000000000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0000000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000000000C0C0C0C0C0C0C0C0C0C0C0C000000000000000
        0000000000000000000000FF0000000000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000000000000000000000000000C0C0C0000000FFFFFFFFFFFFFFFF
        FFCCCCCC00000000000000000000000000000000000000000000000000000000
        0000000000FFFFFFFFFFFF000000C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFF
        000000000000CCCCCCCCCCCCCCCCCCCCCCCC999999CCCCCC9999990000000000
        00FFFFFFFFFFFF000000C0C0C0000000FFFFFFFFFFFFFFFFFF000000CCCCCCFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF666666999999CCCCCC999999000000FFFFFF
        FFFFFF000000C0C0C0000000FFFFFFFFFFFFCCCCCC000000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFCCCCCC999999666666CCCCCC666666000000FFFFFFFFFFFF00
        0000C0C0C0000000FFFFFFFFFFFF999999999999FFFFFFFFFFFFFFFFFFFFFFFF
        CCCCCC666666000000666666CCCCCC999999000000FFFFFFFFFFFF000000C0C0
        C0000000FFFFFFFFFFFF000000CCCCCCFFFFFFFFFFFFFFFFFFFFFFFF00000099
        9999000000999999000000000000000000FFFFFFFFFFFF000000C0C0C0000000
        FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFCCCCCC0000000000000000
        00000000666666CCCCCC000000000000FFFFFF000000C0C0C0000000FFFFFFFF
        FFFF000000FFFFFFCCCCCCFFFFFFFFFFFF999999000000000000666666CCCCCC
        000000CCCCCC666666000000FFFFFF000000C0C0C0000000FFFFFFFFFFFF0000
        00FFFFFFCCCCCCFFFFFFFFFFFF666666000000999999000000CCCCCC00000066
        6666CCCCCC000000FFFFFF000000C0C0C0000000FFFFFFFFFFFF000000FFFFFF
        CCCCCCFFFFFFFFFFFF999999000000CCCCCC000000666666CCCCCC0000000000
        00FFFFFFFFFFFF000000C0C0C0000000FFFFFFFFFFFF000000FFFFFFCCCCCC66
        6666FFFFFFFFFFFF000000666666CCCCCC000000FFFFFF000000FFFFFFFFFFFF
        FFFFFF000000C0C0C0000000FFFFFFFFFFFF000000FFFFFFCCCCCC0000009999
        99FFFFFF000000000000FFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFF00
        0000C0C0C0000000FFFFFFFFFFFF000000FFFFFFCCCCCC000000000000FFFFFF
        666666000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0
        C0000000FFFFFFFFFFFF000000FFFFFFCCCCCC000000000000FFFFFFCCCCCC00
        0000FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0C0000000
        FFFFFFFFFFFF000000FFFFFFCCCCCC000000000000FFFFFFCCCCCC000000FFFF
        FFFFFFFF000000000000000000000000000000000000C0C0C0000000FFFFFFFF
        FFFF000000FFFFFFCCCCCC000000FFFFFF000000000000FFFFFFFFFFFFFFFFFF
        000000FFFFFFFFFFFFFFFFFF000000C0C0C0C0C0C0000000FFFFFFFFFFFF0000
        00FFFFFFCCCCCC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
        FFFFFFFFFF000000C0C0C0C0C0C0C0C0C0000000FFFFFFFFFFFF000000FFFFFF
        666666000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF0000
        00C0C0C0C0C0C0C0C0C0C0C0C0000000000000000000000000FFFFFF99999900
        0000000000000000000000000000000000000000000000000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000999999999999000000C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0}
    end
    object Z2bbtnCanc2: TBitBtn
      Left = 724
      Top = 278
      Width = 32
      Height = 31
      Hint = 'Cancela Actualizaciones del Detalle'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      TabStop = False
      OnClick = Z2bbtnCanc2Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033911833333333333333333F333333333333
        0000339111833333911333333388F333333F3333000033911118333911118333
        38F38F333F88F33300003339111183911111833338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003339
        1118333911183333338F33838F338F33000033911183333391118333338FF833
        38F338F300003391183333333911133333388333338FFF830000333913333333
        3391833333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object Z2bbtnGraba: TBitBtn
      Left = 617
      Top = 278
      Width = 32
      Height = 31
      Hint = 'Grabar Registro'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
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
    object Z2bbtnAcepta: TBitBtn
      Left = 681
      Top = 278
      Width = 32
      Height = 31
      Hint = 'Acepta Registro'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
      OnClick = Z2bbtnAceptaClick
      Glyph.Data = {
        F2010000424DF201000000000000760000002800000024000000130000000100
        0400000000007C01000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
        3333333333388F3333333333000033334224333333333333338338F333333333
        0000333422224333333333333833338F33333333000033422222243333333333
        83333338F3333333000034222A22224333333338F33F33338F33333300003222
        A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
        38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
        2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
        0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
        333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
        33333A2224A2233333333338F338F83300003333333333A2224A333333333333
        8F338F33000033333333333A222433333333333338F338F30000333333333333
        A224333333333333338F38F300003333333333333A223333333333333338F8F3
        000033333333333333A3333333333333333383330000}
      NumGlyphs = 2
    end
    object Z2bbtnAnula: TBitBtn
      Left = 4
      Top = 278
      Width = 32
      Height = 31
      Hint = 'Anular Documento'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 17
      TabStop = False
      OnClick = Z2bbtnAnulaClick
      Glyph.Data = {
        96010000424D9601000000000000760000002800000015000000180000000100
        0400000000002001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888880009988888888888888888990009990000000000000009990008999
        FFFFFFFFFFFFF999800088999FFFFFFFFFFF99988000880999FFFFFFFFF99908
        8000880F999FFFFFFF999F088000880FF999FFFFF999FF088000880FFF999FFF
        999FFF088000880FFFF999F999FFFF088000880FFFFF99999FFFFF088000880F
        FFFFF999FFFFFF088000880FFFFF99999FFFFF088000880FFFF999F999FFFF08
        8000880FFF999FFF999FFF088000880FF999FFFFF999FF088000880F999FFFFF
        FF999F088000880999FFFFFFFFF99908800088999FFFFFFFFFFF999880008999
        FFFFFFFFFFFFF9998000999FFFFFFFFFFFFFFF99900099000000000000000009
        9000888888888888888888888000888888888888888888888000}
    end
    object Z2bbtnSalir: TBitBtn
      Left = 756
      Top = 278
      Width = 32
      Height = 31
      Hint = 'Salir de Requisición'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'Garamond'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 15
      OnClick = Z2bbtnSalirClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
    end
    object Z2bbtnColocac: TBitBtn
      Left = 508
      Top = 278
      Width = 32
      Height = 31
      Hint = 'Colocación'
      Caption = 'C'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -24
      Font.Name = 'Garamond'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 16
      TabStop = False
      OnClick = Z2bbtnColocacClick
      NumGlyphs = 2
    end
    object Z2bbtnPrint: TBitBtn
      Left = 540
      Top = 278
      Width = 34
      Height = 31
      Hint = 'Emitir Orden de Compra'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 14
      OnClick = Z2bbtnPrintClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
    object Z2bbtnDepuraOC: TBitBtn
      Left = 36
      Top = 278
      Width = 32
      Height = 31
      Hint = 'Depurado Ordenes de Compra'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 18
      OnClick = Z2bbtnDepuraOCClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
    end
    object Panel1: TPanel
      Left = 72
      Top = 279
      Width = 180
      Height = 30
      Color = cl3DLight
      TabOrder = 19
      object Label5: TLabel
        Left = 0
        Top = 7
        Width = 64
        Height = 15
        Caption = 'Visado por:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText1: TDBText
        Left = 81
        Top = 7
        Width = 60
        Height = 16
        AutoSize = True
        DataField = 'ODCVISADOR'
        DataSource = DMLOG.dsOrdComp
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
    end
    object Z2bbtnVisado: TBitBtn
      Left = 649
      Top = 278
      Width = 32
      Height = 31
      Hint = 'Visar'
      Caption = 'V'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -24
      Font.Name = 'Garamond'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 20
      OnClick = Z2bbtnVisadoClick
      NumGlyphs = 2
    end
    object Z2bbtnOrdenpago: TBitBtn
      Left = 468
      Top = 278
      Width = 34
      Height = 31
      Hint = 'Solicitud de Orden de Pago'
      Caption = 'Sol.O.Pag'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Agency FB'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 21
      TabStop = False
      OnClick = Z2bbtnOrdenpagoClick
      NumGlyphs = 2
    end
    object dbgDReqs: TwwDBGrid
      Left = 5
      Top = 21
      Width = 782
      Height = 197
      DisableThemesInTitle = False
      Selected.Strings = (
        'DODCID'#9'5'#9'Nº Item'
        'ARTID'#9'9'#9'Código~Artículo'
        'DODCOBS'#9'34'#9'Detalle'
        'DODCCNT'#9'10'#9'Cantidad'
        'DODCPUN'#9'10'#9'Precio~Unitario'
        'DODCDSCTO'#9'10'#9'% Descuento'
        'DODCIMP'#9'11'#9'Valor~Venta'
        'DODCIMPU'#9'9'#9'% Impuesto')
      MemoAttributes = [mGridShow, mViewOnly, mDisableDialog]
      IniAttributes.Delimiter = ';;'
      TitleColor = 7566265
      FixedCols = 0
      ShowHorzScrollBar = True
      Color = clWhite
      DataSource = DMLOG.dsDOrdComp
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      KeyOptions = [dgEnterToTab]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      TabOrder = 1
      TitleAlignment = taCenter
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -11
      TitleFont.Name = 'Comic Sans MS'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
      UseTFields = False
      OnDblClick = dbgDReqsDblClick
      OnKeyDown = dbgDReqsKeyDown
      object Z2dbgDReqsIButton: TwwIButton
        Left = 0
        Top = 0
        Width = 25
        Height = 33
        Hint = 'Nuevo Detalle'
        AllowAllUp = True
        Glyph.Data = {
          96010000424D9601000000000000760000002800000017000000180000000100
          0400000000002001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00BBBBBBBBBBBB
          BBBBBBBBBBB08887777777777777777778B08800000000000000000078B0880F
          FFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF0
          78B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFF
          FFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880F
          FFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF0
          78B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFF
          FF00000078B0880FFFFFFFFFFF0FF88088B0880FFFFFFFFFFF0F880888B0880F
          FFFFFFFFFF08808888B0880FFFFFFFFFFF08088888B088000000000000008888
          88B08888888888888888888888B08888888888888888888888B0}
        ParentShowHint = False
        ShowHint = True
        OnClick = Z2dbgDReqsIButtonClick
      end
    end
    object cbDisenoRep: TCheckBox
      Left = 714
      Top = 232
      Width = 67
      Height = 17
      Caption = 'Diseño Rep'
      TabOrder = 22
      Visible = False
    end
  end
  object pnlAdvertencias: TPanel
    Left = 122
    Top = 220
    Width = 463
    Height = 227
    ParentBackground = False
    TabOrder = 6
    TabStop = True
    Visible = False
    object Shape15: TShape
      Left = 1
      Top = 1
      Width = 461
      Height = 24
      Align = alTop
      Brush.Color = clRed
    end
    object Label48: TLabel
      Left = 79
      Top = 4
      Width = 305
      Height = 20
      Caption = '**ARTICULOS NO MATRICULADOS**'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Shape16: TShape
      Left = 1
      Top = 187
      Width = 461
      Height = 39
      Align = alBottom
      Brush.Color = clRed
    end
    object wwDBGrid2: TwwDBGrid
      Left = 5
      Top = 33
      Width = 455
      Height = 147
      DisableThemesInTitle = False
      Selected.Strings = (
        'vArtid'#9'10'#9'Cód.Prof.'
        'vArtdes'#9'40'#9'Descripción'
        'vArtidMae'#9'10'#9'Cód.Mae.'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = DSFALTINFO
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -11
      TitleFont.Name = 'Comic Sans MS'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
    end
    object BitBtn5: TBitBtn
      Left = 20
      Top = 197
      Width = 76
      Height = 22
      Caption = 'Acepta'
      TabOrder = 1
      OnClick = BitBtn5Click
    end
    object BitBtn2: TBitBtn
      Left = 341
      Top = 195
      Width = 105
      Height = 25
      Caption = 'Buscar en Maestro'
      TabOrder = 2
      OnClick = BitBtn2Click
    end
  end
  object pnlDetalleA: TPanel
    Left = 68
    Top = 138
    Width = 453
    Height = 266
    Color = 14869218
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Visible = False
    object bvlDetalle: TBevel
      Left = 6
      Top = 24
      Width = 441
      Height = 205
      Shape = bsFrame
    end
    object lblNItem: TLabel
      Left = 16
      Top = 26
      Width = 14
      Height = 15
      Caption = 'Nº'
      Transparent = True
    end
    object TLabel
      Left = 85
      Top = 25
      Width = 36
      Height = 15
      Caption = 'Detalle'
      Transparent = True
    end
    object lblUMed: TLabel
      Left = 16
      Top = 132
      Width = 92
      Height = 15
      Caption = 'Unidad de Medida'
      Transparent = True
    end
    object TLabel
      Left = 302
      Top = 132
      Width = 45
      Height = 15
      Caption = 'Cantidad'
      Transparent = True
    end
    object TLabel
      Left = 358
      Top = 132
      Width = 61
      Height = 15
      Caption = 'Precio Unit.'
      Transparent = True
    end
    object lblDesc: TLabel
      Left = 16
      Top = 179
      Width = 65
      Height = 15
      Caption = 'Descuento %'
      Transparent = True
    end
    object TLabel
      Left = 347
      Top = 179
      Width = 70
      Height = 15
      Caption = 'Importe Total'
      Transparent = True
    end
    object TLabel
      Left = 96
      Top = 179
      Width = 59
      Height = 15
      Caption = 'Impuesto %'
      Transparent = True
    end
    object TLabel
      Left = 175
      Top = 179
      Width = 33
      Height = 15
      Caption = 'ISC %'
      Transparent = True
    end
    object TLabel
      Left = 19
      Top = 68
      Width = 42
      Height = 15
      Caption = 'Articulo'
      Transparent = True
    end
    object Label1: TLabel
      Left = 249
      Top = 132
      Width = 36
      Height = 15
      Caption = 'T. Adq.'
    end
    object TLabel
      Left = 250
      Top = 179
      Width = 59
      Height = 15
      Caption = 'Valor Venta'
      Transparent = True
    end
    object TLabel
      Left = 162
      Top = 131
      Width = 82
      Height = 15
      Caption = 'Pre. Ult. Compra'
      Transparent = True
    end
    object gbxProv: TGroupBox
      Left = 4
      Top = 231
      Width = 431
      Height = 107
      Caption = 
        'Datos del Artículo para el Proveedor (para Impresión de Orden de' +
        ' Compra)'
      TabOrder = 13
      Visible = False
      object TLabel
        Left = 12
        Top = 16
        Width = 35
        Height = 15
        Caption = 'Codigo'
        Transparent = True
      end
      object TLabel
        Left = 14
        Top = 60
        Width = 99
        Height = 15
        Caption = 'Unidad Equivalente'
        Transparent = True
      end
      object TLabel
        Left = 122
        Top = 16
        Width = 62
        Height = 15
        Caption = 'Descripción'
        Transparent = True
      end
      object TLabel
        Left = 308
        Top = 60
        Width = 114
        Height = 15
        Caption = 'Precio Unitario Equiv.'
        Transparent = True
      end
      object TLabel
        Left = 191
        Top = 60
        Width = 80
        Height = 15
        Caption = 'Cantidad Equiv.'
        Transparent = True
      end
      object dbeDescProv: TwwDBEdit
        Left = 121
        Top = 33
        Width = 302
        Height = 23
        DataField = 'ARTDESPROV'
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dblcUMEquiv: TwwDBLookupCombo
        Left = 12
        Top = 76
        Width = 51
        Height = 23
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'UNMID'#9'2'#9'Código'#9'F'
          'UNMDES'#9'20'#9'Unidad de Medida'#9'F'
          'FACTOR'#9'10'#9'Factor'#9'F')
        DataField = 'UNMIDEQUIV'
        LookupField = 'UNMID'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblcUMEquivExit
      end
      object dbeUMEquiv: TwwDBEdit
        Left = 64
        Top = 76
        Width = 123
        Height = 23
        Enabled = False
        ReadOnly = True
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbePUEquiv: TwwDBEdit
        Left = 306
        Top = 76
        Width = 112
        Height = 23
        DataField = 'PUNTEQUIV'
        Enabled = False
        TabOrder = 5
        UnboundDataType = wwDefault
        UsePictureMask = False
        WantReturns = False
        WordWrap = False
        OnEnter = dbeCntEnter
        OnExit = dbeCntExit
      end
      object dbeCantEquiv: TwwDBEdit
        Left = 190
        Top = 76
        Width = 111
        Height = 23
        DataField = 'CNTEQUIV'
        Enabled = False
        TabOrder = 4
        UnboundDataType = wwDefault
        UsePictureMask = False
        WantReturns = False
        WordWrap = False
      end
      object dbeCodProv: TwwDBEdit
        Left = 12
        Top = 33
        Width = 107
        Height = 23
        DataField = 'ARTIDPROV'
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object Z2bbtnRegOk: TBitBtn
      Left = 360
      Top = 235
      Width = 30
      Height = 26
      Hint = 'Confirma Actualización'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 15
      OnClick = Z2bbtnRegOkClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object Z2bbtnRegCanc: TBitBtn
      Left = 398
      Top = 233
      Width = 30
      Height = 28
      Hint = 'Cancela Actualización'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 16
      OnClick = Z2bbtnRegCancClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object stxTitulo2: TStaticText
      Left = 1
      Top = 1
      Width = 451
      Height = 17
      Align = alTop
      Alignment = taCenter
      BorderStyle = sbsSunken
      Caption = 'Detalle de Registro de Ordenes de Compra'
      Color = clHighlight
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      TabOrder = 0
    end
    object dblcUMed: TwwDBLookupCombo
      Left = 16
      Top = 148
      Width = 51
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'UNMID'#9'2'#9'Código'#9'F'
        'UNMDES'#9'20'#9'Unidad de Medida'#9'F'
        'UNMABR'#9'10'#9'Abreviatura'#9'F')
      DataField = 'UNMID'
      LookupTable = DMLOG.cdsUMed
      LookupField = 'UNMID'
      Enabled = False
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcUMedExit
      OnNotInList = dblcNotInList
    end
    object Z2bbtnMasMenos: TBitBtn
      Left = 115
      Top = 229
      Width = 30
      Height = 28
      Hint = 'Confirma Actualización'
      Caption = '+'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 14
      Visible = False
      OnClick = Z2bbtnMasMenosClick
      NumGlyphs = 2
    end
    object edtUMed: TEdit
      Left = 70
      Top = 148
      Width = 89
      Height = 23
      Enabled = False
      TabOrder = 6
    end
    object dbcldArti2: TwwDBEdit
      Left = 17
      Top = 83
      Width = 63
      Height = 23
      CharCase = ecUpperCase
      Color = clInfoBk
      Enabled = False
      MaxLength = 5
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeCnt: TEdit
      Tag = 3
      Left = 301
      Top = 148
      Width = 53
      Height = 23
      TabOrder = 7
      OnEnter = dbeCntEnter
      OnExit = dbeCntExit
    end
    object dbeDscto: TEdit
      Left = 16
      Top = 194
      Width = 75
      Height = 23
      TabOrder = 9
      OnExit = dbeDsctoExit
    end
    object dbeImpInd: TEdit
      Tag = 2
      Left = 94
      Top = 194
      Width = 75
      Height = 23
      TabOrder = 10
      OnExit = dbeDsctoExit
    end
    object dbeISC: TEdit
      Tag = 2
      Left = 172
      Top = 194
      Width = 75
      Height = 23
      TabOrder = 11
      OnExit = dbeDsctoExit
    end
    object dbeImporte: TEdit
      Left = 344
      Top = 194
      Width = 97
      Height = 23
      Enabled = False
      TabOrder = 12
    end
    object memDetalle: TMemo
      Left = 99
      Top = 38
      Width = 342
      Height = 79
      TabOrder = 5
      WantReturns = False
    end
    object dbeItem: TEdit
      Left = 14
      Top = 44
      Width = 63
      Height = 23
      Enabled = False
      TabOrder = 1
    end
    object dbePUnit: TEdit
      Tag = 4
      Left = 355
      Top = 148
      Width = 86
      Height = 23
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      TabOrder = 8
      Text = '0'
      OnExit = dbeDsctoExit
    end
    object edtAdq: TEdit
      Left = 250
      Top = 148
      Width = 45
      Height = 23
      Enabled = False
      TabOrder = 17
    end
    object dbeValVen: TEdit
      Tag = 2
      Left = 249
      Top = 194
      Width = 92
      Height = 23
      Enabled = False
      TabOrder = 18
    end
    object dbcldArti: TwwDBLookupComboDlg
      Left = 15
      Top = 83
      Width = 81
      Height = 23
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Articulos'
      MaxWidth = 0
      MaxHeight = 209
      LookupTable = DMLOG.cdsArti
      LookupField = 'ARTID'
      TabOrder = 3
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnExit = dbcldArtiExit
    end
    object edtUltCompra: TEdit
      Tag = 4
      Left = 163
      Top = 148
      Width = 80
      Height = 23
      BiDiMode = bdLeftToRight
      Enabled = False
      ParentBiDiMode = False
      TabOrder = 19
      Text = '0'
    end
  end
  object pnlObsAnula: TPanel
    Left = 488
    Top = 238
    Width = 305
    Height = 176
    BevelInner = bvLowered
    BevelWidth = 2
    Color = clTeal
    TabOrder = 5
    Visible = False
    object bbtnAceObsAnu: TBitBtn
      Left = 205
      Top = 136
      Width = 36
      Height = 27
      Default = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = bbtnAceObsAnuClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object bbtnCerObsAnu: TBitBtn
      Left = 253
      Top = 136
      Width = 36
      Height = 27
      Cancel = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = bbtnCerObsAnuClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object StaticText2: TStaticText
      Left = 4
      Top = 4
      Width = 297
      Height = 17
      Align = alTop
      Alignment = taCenter
      BorderStyle = sbsSunken
      Caption = 'Glosa Anulación'
      Color = clHighlight
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      TabOrder = 2
      TabStop = True
    end
    object memObsAnu: TMemo
      Left = 8
      Top = 24
      Width = 289
      Height = 105
      ScrollBars = ssVertical
      TabOrder = 3
    end
  end
  object ppArchiveReader1: TppArchiveReader
    DeviceType = 'Screen'
    SuppressOutline = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 57
    Top = 76
    Version = '7.02'
  end
  object cds1: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ValidateWithMask = True
    Left = 25
    Top = 77
  end
  object ppdbOC: TppDBPipeline
    UserName = 'dbOC'
    Left = 54
    Top = 385
  end
  object ppDBCab: TppDBPipeline
    UserName = 'DBCab'
    Left = 96
    Top = 350
  end
  object pprOCP: TppReport
    AutoStop = False
    DataPipeline = ppdbOC
    OnStartPage = pprOCPStartPage
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report1'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 350
    PrinterSetup.mmMarginLeft = 0
    PrinterSetup.mmMarginRight = 350
    PrinterSetup.mmMarginTop = 10000
    PrinterSetup.mmPaperHeight = 280000
    PrinterSetup.mmPaperWidth = 230000
    PrinterSetup.PaperSize = 123
    Template.FileName = 'C:\SOLCompras\SOLFormatos\Ord_Comp_JCP.rtm'
    Units = utMillimeters
    AfterPrint = pprOCPAfterPrint
    BeforePrint = pprOCPBeforePrint
    DeviceType = 'Screen'
    OnPreviewFormCreate = pprOCPPreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 53
    Top = 349
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbOC'
    object ppHeaderBand3: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 75142
      mmPrintPosition = 0
      object ppDBText21: TppDBText
        UserName = 'pdbtSRES2'
        DataField = 'PROVDES'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 12cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 13758
        mmTop = 18785
        mmWidth = 89959
        BandType = 0
      end
      object ppDBText25: TppDBText
        UserName = 'pdbtDIR2'
        DataField = 'PROVDIR'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 12cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 15081
        mmTop = 27252
        mmWidth = 88636
        BandType = 0
      end
      object ppDBText26: TppDBText
        UserName = 'pdbtCOD2'
        DataField = 'PROV'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 12cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 13758
        mmTop = 35983
        mmWidth = 34925
        BandType = 0
      end
      object ppDBText27: TppDBText
        UserName = 'pdbtRUC2'
        DataField = 'PROVRUC'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 12cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 63765
        mmTop = 35983
        mmWidth = 34925
        BandType = 0
      end
      object ppDBText28: TppDBText
        UserName = 'pdbtFAX2'
        DataField = 'PROVFAX'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 12cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 63765
        mmTop = 43921
        mmWidth = 34925
        BandType = 0
      end
      object ppDBText29: TppDBText
        UserName = 'pdbtTLF2'
        DataField = 'PROVTELF'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 12cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 13758
        mmTop = 43921
        mmWidth = 34925
        BandType = 0
      end
      object ppDBText31: TppDBText
        UserName = 'pdbtFENT2'
        DataField = 'ODCFATE'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 12cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 113242
        mmTop = 18785
        mmWidth = 23813
        BandType = 0
      end
      object ppDBText32: TppDBText
        UserName = 'pdbtLENT2'
        DataField = 'LGECABR'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 12cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 113242
        mmTop = 31485
        mmWidth = 24606
        BandType = 0
      end
      object ppDBText33: TppDBText
        UserName = 'pdbtMON2'
        DataField = 'TMONABR'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 12cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 112977
        mmTop = 43656
        mmWidth = 23813
        BandType = 0
      end
      object ppDBText34: TppDBText
        UserName = 'pdbtNUM2'
        DataField = 'ODCID'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 12cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 164836
        mmTop = 14552
        mmWidth = 34925
        BandType = 0
      end
      object ppDBText35: TppDBText
        UserName = 'DBText35'
        DataField = 'ODCFEMI'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 12cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 164836
        mmTop = 22754
        mmWidth = 23813
        BandType = 0
      end
      object ppDBText36: TppDBText
        UserName = 'DBText36'
        DataField = 'CCOMERDES'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 12cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 152400
        mmTop = 43921
        mmWidth = 44979
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Label8'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 8731
        mmLeft = 112977
        mmTop = 7938
        mmWidth = 23548
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      BeforePrint = ppDetailBand3BeforePrint
      PrintCount = 29
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 70000
      object ppDBText37: TppDBText
        UserName = 'DBText37'
        DataField = 'ARTID'
        DataPipeline = ppdbOC
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbOC'
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText39: TppDBText
        UserName = 'pdbUNMED2'
        ReprintOnOverFlow = True
        DataField = 'UNMABR'
        DataPipeline = ppdbOC
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbOC'
        mmHeight = 3704
        mmLeft = 109802
        mmTop = 0
        mmWidth = 12435
        BandType = 4
      end
      object ppDBText40: TppDBText
        UserName = 'pdbtCANT2'
        DataField = 'DODCCNT'
        DataPipeline = ppdbOC
        DisplayFormat = '#,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbOC'
        mmHeight = 3704
        mmLeft = 123296
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText41: TppDBText
        UserName = 'pdbtPUNIT2'
        DataField = 'DODCPUN'
        DataPipeline = ppdbOC
        DisplayFormat = '#,###,##0.0000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbOC'
        mmHeight = 3704
        mmLeft = 141023
        mmTop = 0
        mmWidth = 23813
        BandType = 4
      end
      object ppDBText42: TppDBText
        UserName = 'pdbtDSCTO2'
        DataField = 'DODCDSCTO'
        DataPipeline = ppdbOC
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbOC'
        mmHeight = 3704
        mmLeft = 167482
        mmTop = 0
        mmWidth = 16404
        BandType = 4
      end
      object ppDBText43: TppDBText
        UserName = 'pdbtIMPORT2'
        DataField = 'DODCIMP'
        DataPipeline = ppdbOC
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbOC'
        mmHeight = 3704
        mmLeft = 187855
        mmTop = 0
        mmWidth = 19050
        BandType = 4
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'ARTDES'
        DataPipeline = ppdbOC
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 12cpi'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppdbOC'
        mmHeight = 3704
        mmLeft = 18256
        mmTop = 0
        mmWidth = 84667
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppvLin: TppVariable
        UserName = 'vLin'
        CalcOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3440
        mmLeft = 104246
        mmTop = 0
        mmWidth = 3175
        BandType = 4
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'VAN...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 4233
        mmLeft = 17992
        mmTop = 0
        mmWidth = 10319
        BandType = 4
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'VIENEN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 4233
        mmLeft = 17992
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
    end
    object ppSummaryBand3: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 84931
      mmPrintPosition = 195000
      object ppDBText44: TppDBText
        UserName = 'DBText44'
        DataField = 'ODCIXTCC'
        DataPipeline = ppDBCab
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 12cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 110861
        mmTop = 6350
        mmWidth = 26723
        BandType = 7
      end
      object ppDBText45: TppDBText
        UserName = 'dbtIGV2'
        DataField = 'ODCTTIMPU'
        DataPipeline = ppDBCab
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 12cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 143934
        mmTop = 6350
        mmWidth = 27252
        BandType = 7
      end
      object ppDBText46: TppDBText
        UserName = 'pdbtIMPTOTAL2'
        DataField = 'ODCTOTALG'
        DataPipeline = ppDBCab
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 12cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 182563
        mmTop = 6350
        mmWidth = 23283
        BandType = 7
      end
      object ppdbmObse: TppDBMemo
        UserName = 'dbmObse'
        CharWrap = True
        DataField = 'ODCOBS'
        DataPipeline = ppDBCab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 7144
        mmLeft = 1058
        mmTop = 17727
        mmWidth = 209286
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'TMONABR'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 12cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 175419
        mmTop = 6350
        mmWidth = 6350
        BandType = 7
      end
    end
  end
  object pprOCPE: TppReport
    AutoStop = False
    DataPipeline = ppdbOC
    OnStartPage = pprOCPEStartPage
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'rOCPE'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 350
    PrinterSetup.mmMarginLeft = 350
    PrinterSetup.mmMarginRight = 350
    PrinterSetup.mmMarginTop = 350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\DemaExes\RTMS\LOGSG\Dema\OrdComp.rtm'
    Template.SaveTo = stDatabase
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = pprOCPEPreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 97
    Top = 386
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbOC'
    object ppHeaderBand4: TppHeaderBand
      BeforePrint = ppHeaderBand4BeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 74877
      mmPrintPosition = 0
      object ppShape10: TppShape
        UserName = 'Shape10'
        Shape = stRoundRect
        mmHeight = 55033
        mmLeft = 110067
        mmTop = 12171
        mmWidth = 30956
        BandType = 0
      end
      object ppShape7: TppShape
        UserName = 'Shape7'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 6085
        mmLeft = 5292
        mmTop = 68527
        mmWidth = 200290
        BandType = 0
      end
      object ppShape8: TppShape
        UserName = 'Shape8'
        Shape = stRoundRect
        mmHeight = 15346
        mmLeft = 142346
        mmTop = 51594
        mmWidth = 62442
        BandType = 0
      end
      object ppShape9: TppShape
        UserName = 'Shape9'
        Pen.Width = 3
        Shape = stRoundRect
        mmHeight = 38100
        mmLeft = 142082
        mmTop = 10319
        mmWidth = 62442
        BandType = 0
      end
      object ppShape11: TppShape
        UserName = 'Shape11'
        Shape = stRoundRect
        mmHeight = 35454
        mmLeft = 6085
        mmTop = 31485
        mmWidth = 103452
        BandType = 0
      end
      object ppDBText49: TppDBText
        UserName = 'DBText49'
        DataField = 'PROV'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 47361
        mmWidth = 34925
        BandType = 0
      end
      object ppDBText50: TppDBText
        UserName = 'DBText50'
        DataField = 'PROVRUC'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 72231
        mmTop = 47361
        mmWidth = 35719
        BandType = 0
      end
      object ppDBText51: TppDBText
        UserName = 'DBText51'
        DataField = 'PROVFAX'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 72231
        mmTop = 60325
        mmWidth = 35454
        BandType = 0
      end
      object ppDBText52: TppDBText
        UserName = 'DBText52'
        DataField = 'PROVTELF'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 60325
        mmWidth = 34925
        BandType = 0
      end
      object ppDBText54: TppDBText
        UserName = 'DBText54'
        DataField = 'ODCFATE'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 113242
        mmTop = 34131
        mmWidth = 23813
        BandType = 0
      end
      object ppDBText55: TppDBText
        UserName = 'DBText55'
        DataField = 'LGECDES'
        DataPipeline = ppDBCab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 2822
        mmLeft = 111390
        mmTop = 44715
        mmWidth = 28575
        BandType = 0
      end
      object ppDBText57: TppDBText
        UserName = 'DBText57'
        DataField = 'ODCID'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 5292
        mmLeft = 166423
        mmTop = 26194
        mmWidth = 23019
        BandType = 0
      end
      object ppDBText58: TppDBText
        UserName = 'DBText58'
        AutoSize = True
        DataField = 'ODCFEMI'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3048
        mmLeft = 166423
        mmTop = 34131
        mmWidth = 16933
        BandType = 0
      end
      object ppDBText59: TppDBText
        UserName = 'DBText59'
        DataField = 'CCOMERDES'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 148696
        mmTop = 57679
        mmWidth = 44979
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Caption = 'SEÑORES'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 7144
        mmTop = 34131
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        Caption = 'DIRECCIÓN'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 7144
        mmTop = 40746
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        Caption = 'CODIGO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 7144
        mmTop = 47361
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        Caption = 'R.U.C'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 61648
        mmTop = 47361
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'Label34'
        Caption = 'TELEFONO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 7144
        mmTop = 60325
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        Caption = 'FAX'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 63765
        mmTop = 60325
        mmWidth = 5556
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 110067
        mmTop = 17992
        mmWidth = 30692
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 110067
        mmTop = 28310
        mmWidth = 30692
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 110067
        mmTop = 33338
        mmWidth = 30692
        BandType = 0
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 110067
        mmTop = 38629
        mmWidth = 30692
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 110067
        mmTop = 43127
        mmWidth = 30692
        BandType = 0
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 110331
        mmTop = 48683
        mmWidth = 30692
        BandType = 0
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 110331
        mmTop = 53181
        mmWidth = 30692
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        Caption = 'Nº'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 159809
        mmTop = 26194
        mmWidth = 4233
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'Label37'
        Caption = 'FECHA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 154782
        mmTop = 34131
        mmWidth = 9260
        BandType = 0
      end
      object pplReq: TppLabel
        UserName = 'lReq'
        Caption = 'REQUISICION'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3133
        mmLeft = 116258
        mmTop = 13494
        mmWidth = 18627
        BandType = 0
      end
      object ppLabel39: TppLabel
        UserName = 'Label102'
        Caption = 'FECHA DE ENTREGA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 110596
        mmTop = 29369
        mmWidth = 29633
        BandType = 0
      end
      object ppLabel40: TppLabel
        UserName = 'Label40'
        Caption = 'LUGAR DE ENTREGA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 110596
        mmTop = 39158
        mmWidth = 29633
        BandType = 0
      end
      object ppLabel41: TppLabel
        UserName = 'Label41'
        Caption = 'MONEDA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 120121
        mmTop = 49213
        mmWidth = 11113
        BandType = 0
      end
      object ppLine16: TppLine
        UserName = 'Line16'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 142346
        mmTop = 56886
        mmWidth = 62177
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'Label42'
        Caption = 'ORDEN DE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 6773
        mmLeft = 158486
        mmTop = 12435
        mmWidth = 29887
        BandType = 0
      end
      object pplCia: TppLabel
        UserName = 'lCia'
        AutoSize = False
        Caption = 'Servicios Generales'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4939
        mmLeft = 6085
        mmTop = 9790
        mmWidth = 102923
        BandType = 0
      end
      object ppLabel46: TppLabel
        UserName = 'Label46'
        Caption = 'CODIGO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 11642
        mmTop = 69586
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel47: TppLabel
        UserName = 'Label47'
        Caption = 'D E S C R I P C I O N '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 50800
        mmTop = 69586
        mmWidth = 40746
        BandType = 0
      end
      object ppLabel48: TppLabel
        UserName = 'Label48'
        Caption = 'U.M.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 117475
        mmTop = 69586
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel49: TppLabel
        UserName = 'Label202'
        Caption = 'CANT.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 131498
        mmTop = 69586
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel50: TppLabel
        UserName = 'Label50'
        Caption = 'PRECIO UNIT.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 147109
        mmTop = 69586
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel51: TppLabel
        UserName = 'Label51'
        Caption = 'DSCTO.%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 171450
        mmTop = 69586
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel52: TppLabel
        UserName = 'Label52'
        Caption = 'IMPORTE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 190500
        mmTop = 69586
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel53: TppLabel
        UserName = 'Label53'
        Caption = 'RUC Nº'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 6085
        mmTop = 26723
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel54: TppLabel
        UserName = 'Label54'
        Caption = 'CONDICIONES DE PAGO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 157163
        mmTop = 52652
        mmWidth = 35190
        BandType = 0
      end
      object ppDBText70: TppDBText
        UserName = 'DBText1'
        DataField = 'CIADES'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        DataPipelineName = 'ppDBCab'
        mmHeight = 5027
        mmLeft = 78581
        mmTop = 2910
        mmWidth = 94192
        BandType = 0
      end
      object ppDBText71: TppDBText
        UserName = 'DBText2'
        DataField = 'CIADIRE'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 4233
        mmLeft = 6085
        mmTop = 17727
        mmWidth = 93927
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText501'
        DataField = 'CIARUC'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 18256
        mmTop = 26723
        mmWidth = 20108
        BandType = 0
      end
      object ppLblciatlf: TppLabel
        UserName = 'Lblciatlf'
        Caption = 'Telf. '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 6085
        mmTop = 22490
        mmWidth = 6350
        BandType = 0
      end
      object ppDBTCiatlf: TppDBText
        UserName = 'DBTCiatlf'
        DataField = 'CIATLF'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 14817
        mmTop = 22490
        mmWidth = 42598
        BandType = 0
      end
      object ppLblciafax: TppLabel
        UserName = 'Lblciafax'
        Caption = ' - Fax '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 59531
        mmTop = 22490
        mmWidth = 8202
        BandType = 0
      end
      object ppDBTciafax: TppDBText
        UserName = 'DBTciafax'
        DataField = 'CIAFAX'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 69850
        mmTop = 22490
        mmWidth = 33338
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'PROVDES'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 34131
        mmWidth = 82286
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'PROVDIR'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 40746
        mmWidth = 82286
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'CONTACTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 7144
        mmTop = 53711
        mmWidth = 14817
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'PROVREPR'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 53711
        mmWidth = 82550
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 110596
        mmTop = 57944
        mmWidth = 30692
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'TIPO CAMBIO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 114829
        mmTop = 58473
        mmWidth = 20373
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 110596
        mmTop = 62442
        mmWidth = 30692
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'ODCTCAMB'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 4233
        mmLeft = 116946
        mmTop = 62971
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'TMONABR'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 4233
        mmLeft = 117211
        mmTop = 53975
        mmWidth = 17198
        BandType = 0
      end
      object pplReq1: TppLabel
        UserName = 'Label2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = []
        mmHeight = 2822
        mmLeft = 111919
        mmTop = 19315
        mmWidth = 11853
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'T.Compra'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 144992
        mmTop = 41010
        mmWidth = 13494
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'SOLIC. ARTICULOS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3048
        mmLeft = 160867
        mmTop = 41010
        mmWidth = 27093
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'ODCEST'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        DataPipelineName = 'ppDBCab'
        mmHeight = 7408
        mmLeft = 143404
        mmTop = 28840
        mmWidth = 58738
        BandType = 0
      end
      object pplReq2: TppLabel
        UserName = 'lReq1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = []
        mmHeight = 2822
        mmLeft = 126736
        mmTop = 19315
        mmWidth = 11853
        BandType = 0
      end
      object pplReq3: TppLabel
        UserName = 'Label7'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = []
        mmHeight = 2822
        mmLeft = 111919
        mmTop = 23813
        mmWidth = 11853
        BandType = 0
      end
      object pplReq4: TppLabel
        UserName = 'lReq4'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = []
        mmHeight = 3704
        mmLeft = 126736
        mmTop = 23813
        mmWidth = 1693
        BandType = 0
      end
      object pplDerrama: TppLabel
        UserName = 'Label8'
        Caption = 'DERRAMA MAGISTERIAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5644
        mmLeft = 6085
        mmTop = 3440
        mmWidth = 60537
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'NUMREQUSU'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 8731
        mmLeft = 111919
        mmTop = 18785
        mmWidth = 27517
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'FECPAG'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3048
        mmLeft = 174096
        mmTop = 62442
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Fecha de Pago'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 148696
        mmTop = 62442
        mmWidth = 21960
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = 'COMPRA / SERVICIOS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 6773
        mmLeft = 142875
        mmTop = 17992
        mmWidth = 60791
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      BeforePrint = ppDetailBand4BeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 75000
      object ppDBText60: TppDBText
        UserName = 'DBText60'
        DataField = 'ARTID'
        DataPipeline = ppdbOC
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbOC'
        mmHeight = 3704
        mmLeft = 7673
        mmTop = 0
        mmWidth = 26194
        BandType = 4
      end
      object ppDBText62: TppDBText
        UserName = 'DBText62'
        DataField = 'UNMABR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 116000
        mmTop = 0
        mmWidth = 10000
        BandType = 4
      end
      object ppDBText63: TppDBText
        UserName = 'DBText63'
        DataField = 'DODCCNT'
        DataPipeline = ppdbOC
        DisplayFormat = '### ###,###.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbOC'
        mmHeight = 3704
        mmLeft = 127000
        mmTop = 0
        mmWidth = 18000
        BandType = 4
      end
      object ppDBText64: TppDBText
        UserName = 'DBText64'
        DataField = 'DODCPUN'
        DataPipeline = ppdbOC
        DisplayFormat = '###,###,###.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbOC'
        mmHeight = 3704
        mmLeft = 146050
        mmTop = 0
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText65: TppDBText
        UserName = 'DBText65'
        DataField = 'DODCDSCTO'
        DataPipeline = ppdbOC
        DisplayFormat = '###,###,###.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbOC'
        mmHeight = 3704
        mmLeft = 169334
        mmTop = 0
        mmWidth = 16404
        BandType = 4
      end
      object ppDBText66: TppDBText
        UserName = 'DBText66'
        DataField = 'DODCIMP'
        DataPipeline = ppdbOC
        DisplayFormat = '###,###,###.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbOC'
        mmHeight = 3704
        mmLeft = 186796
        mmTop = 0
        mmWidth = 17727
        BandType = 4
      end
      object ppDBMemo2: TppDBMemo
        UserName = 'DBMemo2'
        CharWrap = False
        DataField = 'ARTDES'
        DataPipeline = ppdbOC
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppdbOC'
        mmHeight = 3969
        mmLeft = 35454
        mmTop = 0
        mmWidth = 78317
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'VAN...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3440
        mmLeft = 35719
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'VIENEN'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3440
        mmLeft = 35719
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 51065
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Hecho por:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 32808
        mmTop = 30427
        mmWidth = 18521
        BandType = 8
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Visado por:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 96044
        mmTop = 30427
        mmWidth = 20373
        BandType = 8
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Vº Bº'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 166159
        mmTop = 30427
        mmWidth = 9260
        BandType = 8
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 17727
        mmTop = 29369
        mmWidth = 47890
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 82021
        mmTop = 29369
        mmWidth = 47890
        BandType = 8
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 145786
        mmTop = 29369
        mmWidth = 47890
        BandType = 8
      end
      object ppDBText2: TppDBText
        UserName = 'DBText3'
        DataField = 'USUARIO'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 17727
        mmTop = 23283
        mmWidth = 47890
        BandType = 8
      end
      object ppDBText3: TppDBText
        UserName = 'DBText4'
        DataField = 'VISADO'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 88900
        mmTop = 23813
        mmWidth = 34925
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 8202
        mmTop = 31750
        mmWidth = 7938
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 30163
      mmPrintPosition = 0
      object ppShape12: TppShape
        UserName = 'Shape12'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 5027
        mmLeft = 0
        mmTop = 265
        mmWidth = 205846
        BandType = 7
      end
      object ppDBText67: TppDBText
        UserName = 'DBText67'
        DataField = 'ODCTOTALISC'
        DataPipeline = ppDBCab
        DisplayFormat = '###,###,###.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 150284
        mmTop = 5556
        mmWidth = 21431
        BandType = 7
      end
      object ppDBText68: TppDBText
        UserName = 'DBText68'
        DataField = 'ODCTOTALG'
        DataPipeline = ppDBCab
        DisplayFormat = '###,###,###.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 179917
        mmTop = 5556
        mmWidth = 23548
        BandType = 7
      end
      object ppLabel55: TppLabel
        UserName = 'Label55'
        Caption = 'SUB-TOTAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 98425
        mmTop = 794
        mmWidth = 16669
        BandType = 7
      end
      object ppLabel56: TppLabel
        UserName = 'Label56'
        Caption = 'I.S.C'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 162454
        mmTop = 794
        mmWidth = 9260
        BandType = 7
      end
      object ppLabel57: TppLabel
        UserName = 'Label57'
        Caption = 'IMPORTE TOTAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 179388
        mmTop = 794
        mmWidth = 24077
        BandType = 7
      end
      object ppLabel58: TppLabel
        UserName = 'Label58'
        Caption = 'I.G.V'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 134409
        mmTop = 794
        mmWidth = 9260
        BandType = 7
      end
      object ppDBText69: TppDBText
        UserName = 'DBText69'
        DataField = 'ODCTTIMPU'
        DataPipeline = ppDBCab
        DisplayFormat = '###,###,###.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 124619
        mmTop = 5556
        mmWidth = 19050
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'DODCIMP'
        DataPipeline = ppdbOC
        DisplayFormat = '###,###,###.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbOC'
        mmHeight = 3704
        mmLeft = 92075
        mmTop = 5556
        mmWidth = 23019
        BandType = 7
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Observaciones :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 7408
        mmTop = 11906
        mmWidth = 27781
        BandType = 7
      end
      object ppDBMemo3: TppDBMemo
        UserName = 'DBMemo3'
        CharWrap = False
        DataField = 'ODCOBS'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 4498
        mmLeft = 37306
        mmTop = 11642
        mmWidth = 168540
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'DODCDSCTO'
        DataPipeline = ppdbOC
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbOC'
        mmHeight = 3175
        mmLeft = 65088
        mmTop = 5556
        mmWidth = 17198
        BandType = 7
      end
      object ppLabel2: TppLabel
        UserName = 'Label9'
        Caption = 'DESCUENTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 66940
        mmTop = 794
        mmWidth = 15346
        BandType = 7
      end
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppDBMemo3
        TraverseAllData = False
        DataPipelineName = 'ppdbOrdenPagoPorOC'
        mmHeight = 6350
        mmLeft = 0
        mmTop = 21167
        mmWidth = 209300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppdbOrdenPagoPorOC
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'rOCPE'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 350
          PrinterSetup.mmMarginLeft = 350
          PrinterSetup.mmMarginRight = 350
          PrinterSetup.mmMarginTop = 350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Units = utMillimeters
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppdbOrdenPagoPorOC'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 11113
            mmPrintPosition = 0
            object ppDBText22: TppDBText
              UserName = 'DBText22'
              AutoSize = True
              DataField = 'ODCTOTALG'
              DataPipeline = ppdbOrdenPagoPorOC
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppdbOrdenPagoPorOC'
              mmHeight = 2709
              mmLeft = 23019
              mmTop = 7938
              mmWidth = 8636
              BandType = 1
            end
            object ppDBText23: TppDBText
              UserName = 'DBText23'
              AutoSize = True
              DataField = 'ORDPAGTOT'
              DataPipeline = ppdbOrdenPagoPorOC
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppdbOrdenPagoPorOC'
              mmHeight = 2709
              mmLeft = 53975
              mmTop = 7938
              mmWidth = 8636
              BandType = 1
            end
            object ppDBText24: TppDBText
              UserName = 'DBText24'
              AutoSize = True
              DataField = 'ORDPAGPEN'
              DataPipeline = ppdbOrdenPagoPorOC
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppdbOrdenPagoPorOC'
              mmHeight = 2709
              mmLeft = 83873
              mmTop = 7938
              mmWidth = 5757
              BandType = 1
            end
            object ppLabel15: TppLabel
              UserName = 'Label15'
              Caption = 'Situación Actual de la Orden de Compra'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 7
              Font.Style = [fsBold, fsUnderline]
              Transparent = True
              mmHeight = 2794
              mmLeft = 10319
              mmTop = 4233
              mmWidth = 54695
              BandType = 1
            end
            object ppLabel16: TppLabel
              UserName = 'Label16'
              Caption = 'Total OC:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2794
              mmLeft = 10319
              mmTop = 7938
              mmWidth = 12171
              BandType = 1
            end
            object ppLabel17: TppLabel
              UserName = 'Label17'
              Caption = 'Total Docs:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2794
              mmLeft = 38629
              mmTop = 7938
              mmWidth = 15081
              BandType = 1
            end
            object ppLabel18: TppLabel
              UserName = 'Label18'
              Caption = 'Saldo OC:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2794
              mmLeft = 70379
              mmTop = 7938
              mmWidth = 12700
              BandType = 1
            end
          end
          object ppDetailBand1: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 2910
            mmPrintPosition = 0
            object ppDBText15: TppDBText
              UserName = 'DBText15'
              DataField = 'OP_DOCUMENTO_DES'
              DataPipeline = ppdbOrdenPagoPorOC
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppdbOrdenPagoPorOC'
              mmHeight = 2646
              mmLeft = 15081
              mmTop = 264
              mmWidth = 32544
              BandType = 4
            end
            object ppDBText16: TppDBText
              UserName = 'DBText16'
              DataField = 'CPSERIE'
              DataPipeline = ppdbOrdenPagoPorOC
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppdbOrdenPagoPorOC'
              mmHeight = 2646
              mmLeft = 48154
              mmTop = 264
              mmWidth = 4763
              BandType = 4
            end
            object ppDBText17: TppDBText
              UserName = 'DBText17'
              DataField = 'CPNODOC'
              DataPipeline = ppdbOrdenPagoPorOC
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppdbOrdenPagoPorOC'
              mmHeight = 2646
              mmLeft = 53446
              mmTop = 264
              mmWidth = 7673
              BandType = 4
            end
            object ppDBText18: TppDBText
              UserName = 'DBText18'
              DataField = 'CPFEMIS'
              DataPipeline = ppdbOrdenPagoPorOC
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppdbOrdenPagoPorOC'
              mmHeight = 2646
              mmLeft = 62442
              mmTop = 264
              mmWidth = 15081
              BandType = 4
            end
            object ppDBText19: TppDBText
              UserName = 'DBText19'
              DataField = 'TOTAL'
              DataPipeline = ppdbOrdenPagoPorOC
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppdbOrdenPagoPorOC'
              mmHeight = 2646
              mmLeft = 78052
              mmTop = 264
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText30: TppDBText
              UserName = 'DBText30'
              DataField = 'NUMORDPAG'
              DataPipeline = ppdbOrdenPagoPorOC
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              SuppressRepeatedValues = True
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppdbOrdenPagoPorOC'
              mmHeight = 2646
              mmLeft = 96573
              mmTop = 0
              mmWidth = 15610
              BandType = 4
            end
            object ppDBText38: TppDBText
              UserName = 'DBText301'
              DataField = 'NUMORDPAG'
              DataPipeline = ppdbOrdenPagoPorOC
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 7
              Font.Style = []
              SuppressRepeatedValues = True
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppdbOrdenPagoPorOC'
              mmHeight = 2646
              mmLeft = 114300
              mmTop = 0
              mmWidth = 15610
              BandType = 4
            end
            object ppDBText47: TppDBText
              UserName = 'DBText302'
              DataField = 'NUMORDPAG'
              DataPipeline = ppdbOrdenPagoPorOC
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 7
              Font.Style = []
              SuppressRepeatedValues = True
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppdbOrdenPagoPorOC'
              mmHeight = 2646
              mmLeft = 131498
              mmTop = 0
              mmWidth = 15610
              BandType = 4
            end
            object ppDBText48: TppDBText
              UserName = 'DBText303'
              DataField = 'NUMORDPAG'
              DataPipeline = ppdbOrdenPagoPorOC
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 7
              Font.Style = []
              SuppressRepeatedValues = True
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppdbOrdenPagoPorOC'
              mmHeight = 2646
              mmLeft = 150284
              mmTop = 0
              mmWidth = 15610
              BandType = 4
            end
          end
          object ppSummaryBand2: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 1588
            mmPrintPosition = 0
          end
          object ppGroup1: TppGroup
            BreakName = 'SECCION'
            DataPipeline = ppdbOrdenPagoPorOC
            KeepTogether = True
            OutlineSettings.CreateNode = True
            UserName = 'Group1'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppdbOrdenPagoPorOC'
            object ppGroupHeaderBand1: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 8202
              mmPrintPosition = 0
              object ppDBText20: TppDBText
                UserName = 'DBText20'
                DataField = 'SECCION'
                DataPipeline = ppdbOrdenPagoPorOC
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 7
                Font.Style = [fsUnderline]
                Transparent = True
                DataPipelineName = 'ppdbOrdenPagoPorOC'
                mmHeight = 3969
                mmLeft = 10319
                mmTop = 265
                mmWidth = 56886
                BandType = 3
                GroupNo = 0
              end
              object ppLabel23: TppLabel
                UserName = 'Label23'
                AutoSize = False
                Caption = 'Tipo Doc'
                Color = 13882323
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taCentered
                mmHeight = 2646
                mmLeft = 10319
                mmTop = 4498
                mmWidth = 36777
                BandType = 3
                GroupNo = 0
              end
              object ppLabel24: TppLabel
                UserName = 'Label24'
                AutoSize = False
                Caption = 'Documento'
                Color = 13882323
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taCentered
                mmHeight = 2646
                mmLeft = 47361
                mmTop = 4498
                mmWidth = 15081
                BandType = 3
                GroupNo = 0
              end
              object ppLabel25: TppLabel
                UserName = 'Label25'
                AutoSize = False
                Caption = 'Fecha Doc'
                Color = 13882323
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taCentered
                mmHeight = 2646
                mmLeft = 62706
                mmTop = 4498
                mmWidth = 14817
                BandType = 3
                GroupNo = 0
              end
              object ppLabel26: TppLabel
                UserName = 'Label26'
                AutoSize = False
                Caption = 'Total'
                Color = 13882323
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taCentered
                mmHeight = 2646
                mmLeft = 77788
                mmTop = 4498
                mmWidth = 17463
                BandType = 3
                GroupNo = 0
              end
              object ppLabel29: TppLabel
                UserName = 'Label29'
                AutoSize = False
                Caption = 'Banco'
                Color = 13882323
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taCentered
                mmHeight = 2646
                mmLeft = 95515
                mmTop = 4498
                mmWidth = 17463
                BandType = 3
                GroupNo = 0
              end
              object ppLabel38: TppLabel
                UserName = 'Label38'
                AutoSize = False
                Caption = 'Cuenta'
                Color = 13882323
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taCentered
                mmHeight = 2646
                mmLeft = 113242
                mmTop = 4498
                mmWidth = 17463
                BandType = 3
                GroupNo = 0
              end
              object ppLabel43: TppLabel
                UserName = 'Label43'
                AutoSize = False
                Caption = 'CCI'
                Color = 13882323
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taCentered
                mmHeight = 2646
                mmLeft = 130969
                mmTop = 4498
                mmWidth = 17463
                BandType = 3
                GroupNo = 0
              end
              object ppLabel44: TppLabel
                UserName = 'Label44'
                AutoSize = False
                Caption = 'TM'
                Color = 13882323
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taCentered
                mmHeight = 2646
                mmLeft = 148696
                mmTop = 4498
                mmWidth = 17463
                BandType = 3
                GroupNo = 0
              end
            end
            object ppGroupFooterBand1: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 3440
              mmPrintPosition = 0
              object ppDBCalc3: TppDBCalc
                UserName = 'DBCalc3'
                DataField = 'TOTAL'
                DataPipeline = ppdbOrdenPagoPorOC
                DisplayFormat = '#,0.00;-#,0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 7
                Font.Style = [fsBold]
                ResetGroup = ppGroup1
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppdbOrdenPagoPorOC'
                mmHeight = 2910
                mmLeft = 78581
                mmTop = 529
                mmWidth = 16669
                BandType = 5
                GroupNo = 0
              end
              object ppLabel19: TppLabel
                UserName = 'Label19'
                Caption = 'Total:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 7
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 2794
                mmLeft = 69321
                mmTop = 529
                mmWidth = 8636
                BandType = 5
                GroupNo = 0
              end
              object ppLine6: TppLine
                UserName = 'Line6'
                Pen.Width = 0
                Weight = 0.125000000000000000
                mmHeight = 1323
                mmLeft = 69586
                mmTop = 0
                mmWidth = 25400
                BandType = 5
                GroupNo = 0
              end
            end
          end
          object ppGroup2: TppGroup
            BreakName = 'NUMORDPAG'
            DataPipeline = ppdbOrdenPagoPorOC
            KeepTogether = True
            OutlineSettings.CreateNode = True
            UserName = 'Group2'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppdbOrdenPagoPorOC'
            object ppGroupHeaderBand2: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 2910
              mmPrintPosition = 0
              object ppDBText13: TppDBText
                UserName = 'DBText13'
                DataField = 'NUMORDPAG'
                DataPipeline = ppdbOrdenPagoPorOC
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 7
                Font.Style = []
                SuppressRepeatedValues = True
                Transparent = True
                DataPipelineName = 'ppdbOrdenPagoPorOC'
                mmHeight = 2709
                mmLeft = 24871
                mmTop = 201
                mmWidth = 12965
                BandType = 3
                GroupNo = 1
              end
              object ppDBText14: TppDBText
                UserName = 'DBText14'
                DataField = 'FECHA'
                DataPipeline = ppdbOrdenPagoPorOC
                DisplayFormat = 'dd/mm/yyyy'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 7
                Font.Style = []
                SuppressRepeatedValues = True
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'ppdbOrdenPagoPorOC'
                mmHeight = 2709
                mmLeft = 52388
                mmTop = 201
                mmWidth = 15081
                BandType = 3
                GroupNo = 1
              end
              object ppLabel21: TppLabel
                UserName = 'Label21'
                AutoSize = False
                Caption = 'Orden Pag:'
                Color = 13882323
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 7
                Font.Style = []
                Transparent = True
                mmHeight = 2709
                mmLeft = 10319
                mmTop = 201
                mmWidth = 14023
                BandType = 3
                GroupNo = 1
              end
              object ppLabel22: TppLabel
                UserName = 'Label22'
                AutoSize = False
                Caption = 'Fecha:'
                Color = 13882323
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 7
                Font.Style = []
                Transparent = True
                mmHeight = 2709
                mmLeft = 43127
                mmTop = 201
                mmWidth = 8731
                BandType = 3
                GroupNo = 1
              end
            end
            object ppGroupFooterBand2: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 3704
              mmPrintPosition = 0
              object ppDBCalc4: TppDBCalc
                UserName = 'DBCalc4'
                DataField = 'TOTAL'
                DataPipeline = ppdbOrdenPagoPorOC
                DisplayFormat = '#,0.00;-#,0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 7
                Font.Style = [fsItalic]
                ResetGroup = ppGroup2
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppdbOrdenPagoPorOC'
                mmHeight = 2794
                mmLeft = 79111
                mmTop = 265
                mmWidth = 16140
                BandType = 5
                GroupNo = 1
              end
              object ppLabel28: TppLabel
                UserName = 'Label28'
                AutoSize = False
                Caption = 'Total Orden Pag:'
                Color = 13882323
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 7
                Font.Style = [fsItalic]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 2910
                mmLeft = 54504
                mmTop = 265
                mmWidth = 23813
                BandType = 5
                GroupNo = 1
              end
            end
          end
        end
      end
    end
    object daDataModule1: TdaDataModule
    end
    object ppParameterList1: TppParameterList
    end
  end
  object Diseno: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = pprOCP
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 98
    Top = 421
  end
  object ppdbOrdenPagoPorOC: TppDBPipeline
    UserName = 'dbOrdenPagoPorOC'
    Left = 441
    Top = 540
  end
  object CDSFALTINFO: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'vArtid'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'vArtdes'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ciaid'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'profid'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'vArtidMae'
        DataType = ftString
        Size = 15
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 472
    Top = 340
    Data = {
      A40000009619E0BD010000001800000005000000000003000000A40006764172
      7469640100490000000100055749445448020002000F00077641727464657301
      0049000000010005574944544802000200320005636961696401004900000001
      000557494454480200020002000670726F666964010049000000010005574944
      5448020002000F00097641727469644D61650100490000000100055749445448
      020002000F000000}
  end
  object DSFALTINFO: TDataSource
    DataSet = CDSFALTINFO
    Left = 476
    Top = 352
  end
end