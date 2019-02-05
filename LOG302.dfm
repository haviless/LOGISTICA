object FRegSolCotizacion: TFRegSolCotizacion
  Left = 281
  Top = 139
  Width = 845
  Height = 583
  Caption = 'Solicitud de Cotizaci'#243'n'
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblCIA: TLabel
    Left = 15
    Top = 3
    Width = 49
    Height = 15
    Caption = 'Compa'#241#237'a'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object lblFReg: TLabel
    Left = 463
    Top = 3
    Width = 59
    Height = 15
    Caption = 'F. Solicitud'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label13: TLabel
    Left = 15
    Top = 40
    Width = 96
    Height = 15
    Caption = 'Tipo de Cotizaci'#243'n'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 543
    Top = 3
    Width = 95
    Height = 15
    Caption = 'N'#186' Sol. Cotizaci'#243'n'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object lblObserv: TLabel
    Left = 15
    Top = 123
    Width = 151
    Height = 15
    Caption = 'Observaciones / Comentarios'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object lblLEntrega: TLabel
    Left = 243
    Top = 40
    Width = 87
    Height = 15
    Caption = 'Lugar de Entrega'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object lblFEntre: TLabel
    Left = 463
    Top = 40
    Width = 52
    Height = 15
    Caption = 'F. Entrega'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object lblComprador: TLabel
    Left = 547
    Top = 40
    Width = 55
    Height = 15
    Caption = 'Comprador'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object lblTMon: TLabel
    Left = 642
    Top = 3
    Width = 66
    Height = 15
    Caption = 'Tipo Moneda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 243
    Top = 3
    Width = 49
    Height = 15
    Caption = 'Localidad'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object GroupBox2: TGroupBox
    Left = 144
    Top = 476
    Width = 185
    Height = 57
    Caption = 'Cuadro Comparativo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 29
    object edtCuadroComparativo: TwwDBEdit
      Left = 8
      Top = 19
      Width = 121
      Height = 23
      TabStop = False
      Enabled = False
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  object GroupBox1: TGroupBox
    Left = 419
    Top = 476
    Width = 340
    Height = 57
    Caption = 'Solicitud de Cotizaci'#243'n'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 27
    object edtEstado: TDBText
      Left = 46
      Top = 23
      Width = 107
      Height = 26
      Alignment = taCenter
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 7
      Top = 26
      Width = 37
      Height = 15
      Caption = 'Estado:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
  end
  object memObservacion: TDBMemo
    Left = 16
    Top = 138
    Width = 745
    Height = 59
    DataField = 'SCCOBS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 10
    OnKeyPress = FormKeyPress
  end
  object dblcCompania: TwwDBLookupCombo
    Left = 15
    Top = 17
    Width = 40
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'CIAID'#9'2'#9'C'#243'digo'#9'F'
      'CIADES'#9'40'#9'Descripci'#243'n'#9'F'
      'CIAABR'#9'15'#9'Abreviatura'#9'F')
    Options = [loColLines, loTitles]
    DropDownCount = 15
    MaxLength = 2
    TabOrder = 0
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    OnExit = dblcCompaniaExit
    OnKeyPress = FormKeyPress
  end
  object edtCompania: TEdit
    Left = 54
    Top = 17
    Width = 187
    Height = 21
    Enabled = False
    TabOrder = 9
  end
  object dtpFechaCotizacion: TwwDBDateTimePicker
    Left = 462
    Top = 17
    Width = 81
    Height = 21
    TabStop = False
    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
    CalendarAttributes.Font.Color = clWindowText
    CalendarAttributes.Font.Height = -11
    CalendarAttributes.Font.Name = 'MS Sans Serif'
    CalendarAttributes.Font.Style = []
    DateFormat = dfLong
    Date = 37158.000000000000000000
    Epoch = 1950
    Enabled = False
    ShowButton = True
    TabOrder = 12
    DisplayFormat = 'dd/mm/yyyy'
  end
  object dblcTipoCotizacion: TwwDBLookupCombo
    Left = 15
    Top = 54
    Width = 43
    Height = 21
    CharCase = ecUpperCase
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'TIPOADQ'#9'2'#9'Tipo de Compra'#9'F'
      'TIPADQDES'#9'30'#9'Descripci'#243'n'#9'F')
    Options = [loColLines, loTitles]
    MaxLength = 2
    TabOrder = 3
    AutoDropDown = False
    ShowButton = True
    SearchDelay = 2
    PreciseEditRegion = False
    AllowClearKey = False
    ShowMatchText = True
    OnExit = dblcTipoCotizacionExit
    OnKeyPress = FormKeyPress
  end
  object edtTipoCotizacion: TEdit
    Left = 60
    Top = 54
    Width = 179
    Height = 21
    Enabled = False
    TabOrder = 13
  end
  object edtNumCotizacion: TwwDBEdit
    Left = 544
    Top = 17
    Width = 97
    Height = 24
    TabStop = False
    CharCase = ecUpperCase
    Color = clInfoBk
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    MaxLength = 8
    ParentFont = False
    TabOrder = 14
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object pnlInventario: TPanel
    Left = 342
    Top = 80
    Width = 460
    Height = 42
    BevelInner = bvLowered
    BiDiMode = bdRightToLeftNoAlign
    Color = 14869218
    ParentBiDiMode = False
    TabOrder = 8
    TabStop = True
    object Label4: TLabel
      Left = 6
      Top = 2
      Width = 68
      Height = 15
      Caption = 'T. Inventario'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 214
      Top = 2
      Width = 43
      Height = 15
      Caption = 'Almac'#233'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object dblcTipoInventario: TwwDBLookupCombo
      Left = 5
      Top = 17
      Width = 50
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TINID'#9'2'#9'Tipo Inventario'#9'F'
        'TINDES'#9'40'#9'Descripci'#243'n'#9'F')
      Options = [loColLines, loTitles]
      DropDownCount = 18
      MaxLength = 2
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcTipoInventarioExit
      OnKeyPress = FormKeyPress
    end
    object edtTipoInventario: TEdit
      Left = 56
      Top = 17
      Width = 155
      Height = 21
      Enabled = False
      TabOrder = 2
    end
    object dblcAlmacen: TwwDBLookupCombo
      Left = 213
      Top = 17
      Width = 50
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'ALMID'#9'2'#9'C'#243'digo'#9'F'
        'ALMDES'#9'25'#9'Descripci'#243'n'#9'F')
      Options = [loColLines, loTitles]
      DropDownCount = 18
      MaxLength = 2
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcAlmacenExit
      OnKeyPress = FormKeyPress
    end
    object edtAlmacen: TEdit
      Left = 264
      Top = 17
      Width = 189
      Height = 21
      Enabled = False
      TabOrder = 3
    end
  end
  object pnlTipoServicio: TPanel
    Left = 15
    Top = 80
    Width = 322
    Height = 42
    BevelInner = bvLowered
    Color = 14869218
    Enabled = False
    TabOrder = 7
    TabStop = True
    object lblObra: TLabel
      Left = 7
      Top = 2
      Width = 86
      Height = 15
      Caption = 'Tipo de Servicio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object dblcTipoServicio: TwwDBLookupCombo
      Left = 7
      Top = 16
      Width = 44
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'OBRAID'#9'10'#9'C'#243'digo'#9'F'
        'OBRADES'#9'40'#9'Descripci'#243'n'#9'F')
      Options = [loColLines, loTitles]
      DropDownCount = 15
      MaxLength = 2
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
      OnExit = dblcTipoServicioExit
      OnKeyPress = FormKeyPress
    end
    object edtTipoServicio: TEdit
      Left = 51
      Top = 16
      Width = 263
      Height = 21
      Enabled = False
      TabOrder = 1
    end
  end
  object pcTabDetalle: TPageControl
    Left = 16
    Top = 200
    Width = 785
    Height = 273
    ActivePage = tsProforma
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    OwnerDraw = True
    ParentFont = False
    TabOrder = 15
    OnDrawTab = pcTabDetalleDrawTab
    object tsCotizacion: TTabSheet
      Caption = 'Detalle de Cotizaci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      object dbgDetalleCotizacion: TwwDBGrid
        Left = 0
        Top = 0
        Width = 777
        Height = 243
        DisableThemesInTitle = False
        MemoAttributes = [mGridShow, mViewOnly, mDisableDialog]
        IniAttributes.Delimiter = ';;'
        TitleColor = 7566265
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        Color = 15792632
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        KeyOptions = [dgEnterToTab]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clNavy
        TitleFont.Height = -11
        TitleFont.Name = 'Comic Sans MS'
        TitleFont.Style = []
        TitleLines = 2
        TitleButtons = False
        OnDblClick = dbgDetalleCotizacionDblClick
        OnKeyDown = dbgDetalleCotizacionKeyDown
        object btnAdicionaDetCotizacion: TwwIButton
          Left = 0
          Top = 0
          Width = 25
          Height = 36
          AllowAllUp = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33333333FF33333333FF333993333333300033377F3333333777333993333333
            300033F77FFF3333377739999993333333333777777F3333333F399999933333
            33003777777333333377333993333333330033377F3333333377333993333333
            3333333773333333333F333333333333330033333333F33333773333333C3333
            330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
            993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
            333333333337733333FF3333333C333330003333333733333777333333333333
            3000333333333333377733333333333333333333333333333333}
          NumGlyphs = 2
          OnClick = btnAdicionaDetCotizacionClick
        end
      end
      object pnlDetalleCotizacion: TPanel
        Left = 176
        Top = 8
        Width = 363
        Height = 217
        Color = 14869218
        TabOrder = 1
        Visible = False
        object lblItem: TLabel
          Left = 4
          Top = 18
          Width = 24
          Height = 15
          Caption = 'Item'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lblCntPed: TLabel
          Left = 250
          Top = 57
          Width = 45
          Height = 15
          Alignment = taCenter
          Caption = 'Cantidad'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object lblUnMed: TLabel
          Left = 4
          Top = 57
          Width = 92
          Height = 15
          Caption = 'Unidad de Medida'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lblTexto: TLabel
          Left = 4
          Top = 97
          Width = 135
          Height = 15
          Caption = 'Observaci'#243'n / Comentario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label22: TLabel
          Left = 84
          Top = 18
          Width = 42
          Height = 15
          Caption = 'Art'#237'culo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object stxTitulo2: TStaticText
          Left = 1
          Top = 1
          Width = 361
          Height = 19
          Align = alTop
          Alignment = taCenter
          BorderStyle = sbsSunken
          Caption = 'Detalle de Cotizaci'#243'n'
          Color = clHighlight
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clHighlightText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          ShowAccelChar = False
          TabOrder = 0
        end
        object btnAdicionarDetalle: TBitBtn
          Left = 299
          Top = 185
          Width = 28
          Height = 27
          Hint = 'Confirma Actualizaci'#243'n'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          OnClick = btnAdicionarDetalleClick
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
        object btnCancelarDetalle: TBitBtn
          Left = 329
          Top = 185
          Width = 28
          Height = 27
          Hint = 'Cancela Actualizaci'#243'n'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          OnClick = btnCancelarDetalleClick
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
        object edtItemServicio: TwwDBEdit
          Left = 4
          Top = 32
          Width = 70
          Height = 21
          Enabled = False
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object memObservacionServicio: TDBMemo
          Left = 4
          Top = 112
          Width = 353
          Height = 70
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          MaxLength = 200
          ParentFont = False
          TabOrder = 5
          OnKeyPress = FormKeyPress
        end
        object edtCantidadPedidaServicio: TwwDBEdit
          Left = 248
          Top = 72
          Width = 60
          Height = 21
          TabOrder = 4
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
          OnKeyPress = FormKeyPress
        end
        object dblcUnidadMedidaServicio: TwwDBLookupCombo
          Left = 4
          Top = 72
          Width = 48
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'UNMID'#9'5'#9'ID'#9'F'
            'UNMDES'#9'40'#9'Unidad de Medida'#9'F')
          LookupField = 'UNMID;UNMDES'
          Options = [loColLines, loTitles]
          MaxLength = 2
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = False
          OnExit = dblcUnidadMedidaServicioExit
          OnKeyPress = FormKeyPress
        end
        object edtUnidadMedServicio: TEdit
          Left = 53
          Top = 72
          Width = 191
          Height = 21
          Enabled = False
          TabOrder = 8
        end
        object cbdlgArticulo: TwwDBLookupComboDlg
          Left = 83
          Top = 32
          Width = 98
          Height = 21
          CharCase = ecUpperCase
          GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
          GridColor = clWhite
          GridTitleAlignment = taLeftJustify
          Caption = 'Art'#237'culo'
          MaxWidth = 0
          MaxHeight = 209
          Selected.Strings = (
            'ARTID'#9'15'#9'C'#243'digo'#9'F'
            'ARTDES'#9'40'#9'Descripci'#243'n'#9'F'
            'ARTABR'#9'15'#9'Abreviatura'#9'F')
          LookupField = 'ARTID'
          TabOrder = 2
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnExit = cbdlgArticuloExit
          OnKeyPress = FormKeyPress
        end
      end
    end
    object tsProforma: TTabSheet
      Caption = 'Proformas de Proveedores'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      object dbgProformas: TwwDBGrid
        Left = 0
        Top = 0
        Width = 777
        Height = 243
        DisableThemesInTitle = False
        Selected.Strings = (
          'DSCCID'#9'6'#9'ID'
          'ARTID'#9'9'#9'Art.'
          'DSCCCNTG'#9'10'#9'Cantidad'
          'DSCOBS'#9'76'#9'Detalle')
        MemoAttributes = [mGridShow, mViewOnly, mDisableDialog]
        IniAttributes.Delimiter = ';;'
        TitleColor = 7566265
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        Color = 15792632
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        KeyOptions = [dgEnterToTab]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clNavy
        TitleFont.Height = -11
        TitleFont.Name = 'Comic Sans MS'
        TitleFont.Style = []
        TitleLines = 2
        TitleButtons = False
        OnDblClick = dbgProformasDblClick
        OnKeyDown = dbgProformasKeyDown
        object btnAdicionaProforma: TwwIButton
          Left = 0
          Top = 0
          Width = 25
          Height = 36
          AllowAllUp = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33333333FF33333333FF333993333333300033377F3333333777333993333333
            300033F77FFF3333377739999993333333333777777F3333333F399999933333
            33003777777333333377333993333333330033377F3333333377333993333333
            3333333773333333333F333333333333330033333333F33333773333333C3333
            330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
            993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
            333333333337733333FF3333333C333330003333333733333777333333333333
            3000333333333333377733333333333333333333333333333333}
          NumGlyphs = 2
          OnClick = btnAdicionaProformaClick
        end
      end
    end
  end
  object btnEditarCabecera: TBitBtn
    Left = 606
    Top = 492
    Width = 32
    Height = 31
    Hint = 'Modifica Datos de Cabecera'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 16
    OnClick = btnEditarCabeceraClick
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
  object btnGrabar: TBitBtn
    Left = 686
    Top = 492
    Width = 32
    Height = 31
    Hint = 'Grabar Solicitud de Cotizaci'#243'n'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 17
    OnClick = btnGrabarClick
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
  object btnAceptar: TBitBtn
    Left = 718
    Top = 492
    Width = 32
    Height = 31
    Hint = 'Acepta Solicitud de Cotizaci'#243'n'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 18
    OnClick = btnAceptarClick
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
  object btnAnular: TBitBtn
    Left = 654
    Top = 492
    Width = 32
    Height = 31
    Hint = 'Anular Solicitud de Cotizaci'#243'n'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 19
    OnClick = btnAnularClick
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
  object btnSalir: TBitBtn
    Left = 769
    Top = 491
    Width = 32
    Height = 31
    Hint = 'Salir de la Ventana'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'Garamond'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 20
    OnClick = btnSalirClick
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
  object dblcLEntrega: TwwDBLookupCombo
    Left = 243
    Top = 54
    Width = 49
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'LGECID'#9'2'#9'C'#243'digo'#9'F'
      'LGECDES'#9'40'#9'Descripci'#243'n'#9'F'
      'LGECABR'#9'15'#9'Abreviatura'#9'F')
    DataField = 'LGECID'
    LookupField = 'LGECID'
    Options = [loColLines, loTitles]
    DropDownCount = 15
    TabOrder = 4
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    OnExit = dblcLEntregaExit
    OnKeyPress = FormKeyPress
  end
  object edtLEntrega: TwwDBEdit
    Left = 293
    Top = 54
    Width = 168
    Height = 21
    Enabled = False
    TabOrder = 21
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dtpFechaEntrega: TwwDBDateTimePicker
    Left = 463
    Top = 54
    Width = 81
    Height = 21
    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
    CalendarAttributes.Font.Color = clWindowText
    CalendarAttributes.Font.Height = -11
    CalendarAttributes.Font.Name = 'MS Sans Serif'
    CalendarAttributes.Font.Style = []
    DataField = 'SCCFENT'
    Date = 36818.000000000000000000
    Epoch = 1950
    ShowButton = True
    TabOrder = 5
    OnKeyPress = FormKeyPress
  end
  object dblcComprador: TwwDBLookupCombo
    Left = 547
    Top = 54
    Width = 49
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'COMPCID'#9'2'#9'C'#243'digo'#9'F'
      'COMPDES'#9'40'#9'Descripci'#243'n'#9'F'
      'COMPABR'#9'15'#9'Abreviatura'#9'F')
    DataField = 'COMPID'
    LookupField = 'COMPCID'
    Options = [loColLines, loTitles]
    DropDownCount = 15
    TabOrder = 6
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    OnExit = dblcCompradorExit
    OnKeyPress = FormKeyPress
  end
  object edtComprador: TwwDBEdit
    Left = 595
    Top = 54
    Width = 207
    Height = 21
    Enabled = False
    TabOrder = 22
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dblcTMoneda: TwwDBLookupCombo
    Left = 642
    Top = 17
    Width = 41
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'TMONID'#9'3'#9'C'#243'digo'#9'F'
      'TMONDES'#9'30'#9'Descripci'#243'n'#9'F'
      'TMONABR'#9'8'#9'Abreviatura'#9'F')
    DataField = 'TMONID'
    LookupField = 'TMONID'
    Options = [loColLines, loTitles]
    TabOrder = 2
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    OnExit = dblcTMonedaExit
    OnKeyPress = FormKeyPress
  end
  object edtTMoneda: TwwDBEdit
    Left = 684
    Top = 17
    Width = 119
    Height = 21
    Enabled = False
    TabOrder = 23
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object btnAceptaCabecera: TBitBtn
    Left = 774
    Top = 169
    Width = 28
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
    TabOrder = 11
    OnClick = btnAceptaCabeceraClick
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
  object dblcLocalidad: TwwDBLookupCombo
    Left = 243
    Top = 17
    Width = 50
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'LOCID'#9'2'#9'C'#243'digo'#9'F'
      'LOCDES'#9'30'#9'Descripci'#243'n'#9'F')
    Options = [loColLines, loTitles]
    DropDownCount = 18
    MaxLength = 2
    TabOrder = 1
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    OnExit = dblcLocalidadExit
    OnKeyPress = FormKeyPress
  end
  object edtLocalidad: TEdit
    Left = 294
    Top = 17
    Width = 166
    Height = 21
    Enabled = False
    TabOrder = 24
  end
  object pnlProformaProveedor: TPanel
    Left = 98
    Top = 246
    Width = 601
    Height = 321
    Color = 14869218
    TabOrder = 25
    Visible = False
    DesignSize = (
      601
      321)
    object lblProv: TLabel
      Left = 155
      Top = 18
      Width = 52
      Height = 15
      Caption = 'Proveedor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 2
      Top = 18
      Width = 43
      Height = 15
      Caption = 'Auxiliar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 3
      Top = 53
      Width = 73
      Height = 15
      Caption = 'Forma de pago'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 176
      Top = 53
      Width = 71
      Height = 15
      Caption = 'Tipo Garant'#237'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 519
      Top = 53
      Width = 77
      Height = 15
      Caption = 'Tiemp. Entrega'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 436
      Top = 53
      Width = 71
      Height = 15
      Caption = 'D'#237'as Vigencia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 419
      Top = 18
      Width = 60
      Height = 15
      Caption = 'F. Proforma'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 505
      Top = 18
      Width = 65
      Height = 15
      Caption = 'N'#186' Proforma'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 5
      Top = 86
      Width = 65
      Height = 15
      Caption = 'Observaci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object stTituloProforma: TStaticText
      Left = 1
      Top = 1
      Width = 599
      Height = 19
      Align = alTop
      Alignment = taCenter
      BorderStyle = sbsSunken
      Caption = 'Proformas de Proveedores'
      Color = clHighlight
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      TabOrder = 0
    end
    object dbgDetalleProforma: TwwDBGrid
      Left = 4
      Top = 139
      Width = 593
      Height = 147
      DisableThemesInTitle = False
      Selected.Strings = (
        'DSCCID'#9'6'#9'ID'
        'ARTID'#9'9'#9'Art.'
        'DSCCCNTG'#9'10'#9'Cantidad'
        'DSCOBS'#9'76'#9'Detalle')
      MemoAttributes = [mGridShow, mViewOnly, mDisableDialog]
      IniAttributes.Delimiter = ';;'
      TitleColor = 7566265
      FixedCols = 0
      ShowHorzScrollBar = True
      Anchors = []
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      Color = 15792632
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      KeyOptions = [dgEnterToTab]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter, dgFooter3DCells]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 9
      TitleAlignment = taCenter
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -11
      TitleFont.Name = 'Comic Sans MS'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
      OnDblClick = dbgDetalleProformaDblClick
      OnKeyDown = dbgDetalleCotizacionKeyDown
    end
    object dblcTipoAuxiliar: TwwDBLookupCombo
      Left = 2
      Top = 32
      Width = 41
      Height = 21
      DropDownAlignment = taLeftJustify
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcTipoAuxiliarExit
      OnKeyPress = FormKeyPress
    end
    object dblcdProveedor: TwwDBLookupComboDlg
      Left = 154
      Top = 32
      Width = 53
      Height = 21
      CharCase = ecUpperCase
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taCenter
      Caption = 'Proveedores'
      MaxWidth = 0
      MaxHeight = 209
      DataField = 'PROV'
      LookupField = 'PROV'
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcdProveedorExit
      OnKeyPress = FormKeyPress
    end
    object edtProveedor: TwwDBEdit
      Left = 207
      Top = 32
      Width = 211
      Height = 21
      CharCase = ecUpperCase
      DataField = 'PROVDES'
      Enabled = False
      MaxLength = 8
      TabOrder = 10
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcFormaDePago: TwwDBLookupCombo
      Left = 3
      Top = 67
      Width = 41
      Height = 21
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TIPOADQ'#9'2'#9'Tipo de Compra'#9'F'
        'TIPADQDES'#9'30'#9'Descripci'#243'n'#9'F')
      Options = [loColLines, loTitles]
      MaxLength = 2
      TabOrder = 3
      AutoDropDown = False
      ShowButton = True
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
      OnExit = dblcFormaDePagoExit
      OnKeyPress = FormKeyPress
    end
    object edtFormaDePago: TEdit
      Left = 45
      Top = 67
      Width = 128
      Height = 21
      Enabled = False
      TabOrder = 11
    end
    object edtTipoAuxiliar: TEdit
      Left = 44
      Top = 32
      Width = 108
      Height = 21
      Enabled = False
      TabOrder = 12
    end
    object dblcTipoGarantia: TwwDBLookupCombo
      Left = 175
      Top = 67
      Width = 43
      Height = 21
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TIPOADQ'#9'2'#9'Tipo de Compra'#9'F'
        'TIPADQDES'#9'30'#9'Descripci'#243'n'#9'F')
      Options = [loColLines, loTitles]
      MaxLength = 2
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
      OnExit = dblcTipoGarantiaExit
      OnKeyPress = FormKeyPress
    end
    object edtTipoGarantia: TEdit
      Left = 218
      Top = 67
      Width = 213
      Height = 21
      Enabled = False
      TabOrder = 13
    end
    object seDiasVigencia: TwwDBSpinEdit
      Left = 436
      Top = 67
      Width = 78
      Height = 21
      Increment = 1.000000000000000000
      MaxValue = 365.000000000000000000
      TabOrder = 5
      UnboundDataType = wwDefault
      OnKeyPress = FormKeyPress
    end
    object seTiempoEntrega: TwwDBSpinEdit
      Left = 519
      Top = 67
      Width = 78
      Height = 21
      Increment = 1.000000000000000000
      MaxValue = 365.000000000000000000
      TabOrder = 6
      UnboundDataType = wwDefault
      OnKeyPress = FormKeyPress
    end
    object btnAceptaCabProforma: TBitBtn
      Left = 567
      Top = 105
      Width = 28
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
      TabOrder = 8
      OnClick = btnAceptaCabProformaClick
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
    object btnCancelaProforma: TBitBtn
      Left = 569
      Top = 288
      Width = 28
      Height = 28
      Hint = 'Cancela Actualizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 14
      OnClick = btnCancelaProformaClick
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
    object dtpFechaProforma: TwwDBDateTimePicker
      Left = 420
      Top = 32
      Width = 81
      Height = 21
      TabStop = False
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DateFormat = dfLong
      Date = 37158.000000000000000000
      Epoch = 1950
      Enabled = False
      ShowButton = True
      TabOrder = 15
      DisplayFormat = 'dd/mm/yyyy'
    end
    object edtNumProforma: TwwDBEdit
      Left = 504
      Top = 32
      Width = 92
      Height = 24
      TabStop = False
      CharCase = ecUpperCase
      Color = clInfoBk
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      MaxLength = 8
      ParentFont = False
      TabOrder = 16
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object memObservacionProforma: TDBMemo
      Left = 3
      Top = 100
      Width = 550
      Height = 36
      DataField = 'PROFOBS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 7
      OnKeyPress = FormKeyPress
    end
    object pnlProformaDetalle: TPanel
      Left = 144
      Top = 102
      Width = 385
      Height = 194
      Color = 14869218
      TabOrder = 17
      Visible = False
      object Label15: TLabel
        Left = 5
        Top = 21
        Width = 24
        Height = 15
        Caption = 'Item'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label16: TLabel
        Left = 5
        Top = 108
        Width = 92
        Height = 15
        Caption = 'Unidad de Medida'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label17: TLabel
        Left = 289
        Top = 108
        Width = 45
        Height = 15
        Alignment = taCenter
        Caption = 'Cantidad'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Label19: TLabel
        Left = 6
        Top = 148
        Width = 79
        Height = 15
        Alignment = taCenter
        Caption = 'Precio Unitario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Label20: TLabel
        Left = 101
        Top = 148
        Width = 62
        Height = 15
        Alignment = taCenter
        Caption = 'Precio Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Label21: TLabel
        Left = 44
        Top = 21
        Width = 42
        Height = 15
        Caption = 'Art'#237'culo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object StaticText2: TStaticText
        Left = 1
        Top = 1
        Width = 383
        Height = 19
        Align = alTop
        Alignment = taCenter
        BorderStyle = sbsSunken
        Caption = 'Detalle de Proforma'
        Color = clHighlight
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clHighlightText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        ShowAccelChar = False
        TabOrder = 0
      end
      object btnAceptaDetProforma: TBitBtn
        Left = 315
        Top = 156
        Width = 32
        Height = 32
        Hint = 'Confirma Actualizaci'#243'n'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = btnAceptaDetProformaClick
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
      object btnCancelaDetProforma: TBitBtn
        Left = 347
        Top = 156
        Width = 32
        Height = 32
        Hint = 'Cancela Actualizaci'#243'n'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = btnCancelaDetProformaClick
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
      object edtProfDetItem: TwwDBEdit
        Left = 5
        Top = 36
        Width = 33
        Height = 21
        Enabled = False
        TabOrder = 5
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dblcProfDetUnidMedida: TwwDBLookupCombo
        Left = 5
        Top = 123
        Width = 48
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'UNMID'#9'5'#9'ID'#9'F'
          'UNMDES'#9'40'#9'Unidad de Medida'#9'F')
        LookupField = 'UNMID;UNMDES'
        Options = [loColLines, loTitles]
        Enabled = False
        MaxLength = 2
        TabOrder = 6
        AutoDropDown = True
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcUnidadMedidaServicioExit
        OnKeyPress = FormKeyPress
      end
      object edtProfDetUnidMedida: TEdit
        Left = 55
        Top = 123
        Width = 226
        Height = 21
        Enabled = False
        TabOrder = 7
      end
      object edtProfDetCantidad: TwwDBEdit
        Left = 285
        Top = 123
        Width = 60
        Height = 21
        Enabled = False
        TabOrder = 8
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnKeyPress = FormKeyPress
      end
      object edtProfDetPrecioUnit: TwwDBEdit
        Left = 16
        Top = 165
        Width = 60
        Height = 21
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = edtProfDetPrecioUnitExit
        OnKeyPress = FormKeyPress
      end
      object edtProfDetTotal: TwwDBEdit
        Left = 102
        Top = 165
        Width = 60
        Height = 21
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = edtProfDetTotalExit
        OnKeyPress = FormKeyPress
      end
      object edtProfDetArticuloID: TwwDBEdit
        Left = 43
        Top = 36
        Width = 60
        Height = 21
        Enabled = False
        TabOrder = 9
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnKeyPress = FormKeyPress
      end
      object edtProfDetArticuloDes: TwwDBEdit
        Left = 121
        Top = 36
        Width = 224
        Height = 21
        Enabled = False
        TabOrder = 10
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnKeyPress = FormKeyPress
      end
      object edtProfDetArticuloDesM: TDBMemo
        Left = 105
        Top = 36
        Width = 275
        Height = 67
        Enabled = False
        TabOrder = 11
      end
    end
  end
  object btnImprimeSolCotizacion: TBitBtn
    Left = 573
    Top = 492
    Width = 32
    Height = 31
    Hint = 'Imprimir Solicitud de Cotizaci'#243'n'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 26
    OnClick = btnImprimeSolCotizacionClick
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
  object btnCComparativo: TBitBtn
    Left = 286
    Top = 492
    Width = 32
    Height = 31
    Hint = 'Cuadro Comparativo'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 28
    OnClick = btnCComparativoClick
    Glyph.Data = {
      860A0000424D860A00000000000036000000280000002C000000140000000100
      180000000000500A000000000000000000000000000000000000C0C2AE919181
      978D86A08E8D927B809A83889385868C88838C9085888F8285867D85857F8A87
      838F8A878E85828F8280998A879B8D87958C829993868B8B7BC5C7B400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008C8B
      69EFEAD1F4E6DAEEDCDBF0E2E6F4E9ECF0E6E6EDE5DEE8E1D8ECE7DEE9E4E3ED
      E6E9F0E2E8EEE0E6F2EAEBE8E2E3E9DFE5E6DDE0F2E7E3EFE5DBF6E9D98F8371
      000000808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
      00008C896AEBE7CFFFFFFBFAFDFFE3FFFFE1FFFFE8F5FDFAFFFFFBFFFFF0FBFF
      E1FFFFDCFEFFE4F9FFDBF3FFDDFFFFD7FEFFDCFFFFE3FDFFF1FFFFFCFFFDE8DE
      D4A59585000000808080F1EBE4808080808080808080808080808080F1EBE480
      8080808080808080808080808080808080808080808080808080808080808080
      C0C0C00000008C8576E2E4DEEDFDFF8ABAD257B9D15EC3DC7FBBD3D8FCFFD8F8
      FF84BCD558C0DD3FBADC55BEE554BFE44EC9E341BFD74DBDDB63C0DA7CBED1DD
      FFFFE0E5E4998D87000000808080F1EBE4000000000000000000000000808080
      F1EBE40000000000000000000000000000000000000000000000000000000000
      00808080C0C0C00000008C8179E6E7EBDCF8FF70B7D962E4FF56DBFF6ABADFC3
      F5FFCCFBFF6DBADB53E0FF39DFFF4AE0FF45DCFF38DEFF3BE4FF46E2FF5BDDFF
      63BDD6D1FFFFDEE2E79B8C8A000000808080F1EBE4000000FFFFFFFFFFFF0000
      00808080F1EBE4000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000808080C0C0C00000009A857DE1DCDEDFFAFF6FB4DF5DDBFF60E0FF
      64B2DDC8F9FFCBF8FF6FBADA5AE5FF3BE0FF48E3FF42DAFF3FE2FF3CE4FF3DE3
      FF55E0FF65BAD4DAFEFFE5DFE4A48887000000808080F1EBE4000000FFFFFFFF
      FFFF000000808080F1EBE4000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF000000808080C0C0C0000000937E6FE5DEDBE3F7FF87BDDE57B6
      DE5AB9E182B9DED6F7FFDCFAFF89BFD656BBD43DB9D74DC2E74CBFE449C0E043
      BFDD3FBEDD57C2DE83BFD5E8FEFFF4E7E9AA8D88000000808080F1EBE4000000
      000000000000000000808080F1EBE40000000000000000000000000000000000
      00000000000000000000000000808080C0C0C0000000948870EBE7D5F5FEFBEA
      FFFFDDFEFFDDFEFFECFCFFF4FBFFF4FAFFEDFBFFDFFEFFD6FEFFD6FEFFD7FDFF
      DCFFFFDAFEFFD4FDFFDAFCFFE7F8FFFBFEFFEBDED69E8B7E000000808080F1EB
      E4F1EBE4F1EBE4F1EBE4F1EBE4F1EBE4F1EBE4F1EBE4F1EBE4F1EBE4F1EBE4F1
      EBE4F1EBE4F1EBE4F1EBE4F1EBE4F1EBE4F1EBE4C0C0C0000000958770EFE9D6
      FAFFFBEAFFFFDCFFFFDCFEFFE8F8FFF4FCFFF6FCFFECFAFFDDFEFFD4FFFFCFF9
      FFD6FEFFDAFEFFD7FBFFD3F9FFDDFCFFEBFBFFFDFEFFEFE2DAA28F8200000080
      8080F1EBE4808080808080808080808080808080F1EBE4808080808080808080
      808080808080808080808080808080808080808080808080C0C0C0000000997E
      70ECE2DBEAFDFF8AC2D361C4DA5DC1DA85BED8DAFAFFDAF9FF81B9D253BED93E
      C0DD44BFE346C0E442C0E245C2E147C0E05FC2DE84BDD3E7FAFFF0E3E59C7F7B
      000000808080F1EBE4000000000000000000000000808080F1EBE40000000000
      00000000000000000000000000000000000000000000000000808080C0C0C000
      0000A07E78E7D9DAE3FDFF6DB6D25BDCFD5ADCFF6EB7DDCDF9FFD1F9FF70B8DA
      53E2FF3AE5FF3DDFFF3CDBFF37DDFF3DE2FF41E1FF57DCFE6DBBD8DDFCFFEDE2
      EC9B7C7F000000808080F1EBE4000000FFFFFFFFFFFF000000808080F1EBE400
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000808080
      C0C0C0000000A17C78E4D5D9E3FBFF73B9DE63DFFF63DEFF75B8E5D1F4FFD5F6
      FF77B8DE59E0FF39DEFF3ED9FF46DEFF42DDFF3FDBFF41DDFF5ADEFF6BBDE0D5
      FAFFE2DEEA957A83000000808080F1EBE4000000FFFFFFFFFFFF000000808080
      F1EBE4000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      00808080C0C0C00000009A7B78E8D9DDECFCFF82B7D261BEDF5FBBDE87B4D9E1
      F7FFE4F7FF84B2D15EC2DF44BFE149BBE44CBBE94ABAE54EBEE84CBEE362C1E2
      79B6D0E1FDFFECE7F0937E81000000808080F1EBE40000000000000000000000
      00808080F1EBE400000000000000000000000000000000000000000000000000
      0000000000808080C0C0C000000090807AE5DCD8FAFFFFE9FEFFDDFFFFDFFFFF
      E9F7FFF8FBFFFBFBFFF2FCFFDFFFFFD8FFFFDAFFFFDBFFFFDCFFFFDDFFFFE1FE
      FFE5FEFFEFFFFFFBFFFFEFE8DF928478000000808080F1EBE4F1EBE4F1EBE4F1
      EBE4F1EBE4F1EBE4F1EBE4F1EBE4F1EBE4F1EBE4F1EBE4F1EBE4F1EBE4F1EBE4
      F1EBE4F1EBE4F1EBE4F1EBE4C0C0C00000008B7F75E9DFD5FFFFF6FFFEF3FFFF
      F8FFFFFAFFFFFCFFFBFBFFFEFCFFFFFBFFFFF9FFFFF8FFFFF7FFFFF6FFFFF8FF
      FFF9FFFFFBFFFCF8FFFFF7FFFFF1F4E8D68D826E000000808080F1EBE4F1EBE4
      F1EBE4F1EBE4F1EBE4F1EBE4F1EBE4F1EBE4F1EBE4F1EBE4F1EBE4F1EBE4F1EB
      E4F1EBE4F1EBE4F1EBE4F1EBE4F1EBE4C0C0C0000000958071F2DDCEF1DBCFF1
      DBCFF1DCD4EDD8D0F2DFD8EBDAD1EBDBCFE8DBCDE8DBCBE8DCCAE7DBC9E4DAC8
      E5DBCAE5DCCEE9DDD1E5DACCEADDCDEBDDCAF2E6CE8F84690000008080808080
      8080808080808080808080808080808080808080808080808080808080808080
      808080808080808080808080808080808080808080808000000093816AAE9B86
      B59E8FBA9F95AD908BB49A94AA958DAB9B8FAC9F8FABA08CAE9F8CAFA08DAD9F
      8DAC9D8DAB9E90ACA193A69A8EAD9F93B2A295A89A88AEA38D92887000000080
      8080000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008080800000008886
      67E5E2C6E8DBCDE5D2CDE5CDCFE3CDCFDBCCC9D5CCC2CAC6B4CAC4B1CCC2B1CF
      C1B5CEC1B9CFC1BBD1C5C1D5C8C6DBCBCCE4D4D5DFD3CFE6DDD4E3DDD0858273
      000000808080E8DBCDE5D2CDE5CDCFE3CDCFDBCCC9D5CCC2CAC6B4CAC4B1CCC2
      B1CFC1B5CEC1B9CFC1BBD1C5C1D5C8C6DBCBCCE4D4D5DFD3CFE6DDD480808000
      000092957BEDEAD5E5D9CFDFCECBE0D2D4D5C8CAD0C7C4CFCAC1D0CABDCEC7B8
      CEC2B6D0C1B8D5C1BCD6C5C2D6CDCADAD2D2ECE0E0F5E7E8EAE1DEF2ECE7F1EB
      E496918800000080808080808080808080808080808080808080808080808080
      8080808080808080808080808080808080808080808080808080808080808080
      808080000000C7BEBB8E827EA38D88A18E8985837B898D877F7C789188858E7D
      7A8F7B768D7A72917B70997B70967D7388837A868A7F8282748C897B938F848C
      857C948882D7CBC7000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000}
    NumGlyphs = 2
  end
  object ppdbSolCotizacion: TppDBPipeline
    UserName = 'dbSolCotizacion'
    Left = 16
    Top = 482
  end
  object pprSolCotizacion: TppReport
    AutoStop = False
    DataPipeline = ppdbSolCotizacion
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\DemaExes\RTMS\LOGSG\Dema\SolCotizacion.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 48
    Top = 482
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbSolCotizacion'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
  object ppdSolCotizacion: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 80
    Top = 482
  end
end
