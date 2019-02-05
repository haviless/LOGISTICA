object FToolConAnno: TFToolConAnno
  Left = 180
  Top = 252
  Width = 810
  Height = 197
  Caption = 'FToolConAnno'
  Color = 14869218
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object pnlTool: TPanel
    Left = 2
    Top = 0
    Width = 800
    Height = 160
    BevelInner = bvRaised
    BorderStyle = bsSingle
    Color = 14869218
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 7
      Width = 49
      Height = 15
      Caption = 'Compa'#241#237'a'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 10
      Top = 60
      Width = 76
      Height = 15
      Caption = 'L'#237'nea Producto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 188
      Top = 6
      Width = 68
      Height = 15
      Caption = 'T. Inventario'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 555
      Top = 7
      Width = 20
      Height = 15
      Caption = 'A'#241'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 186
      Top = 60
      Width = 37
      Height = 15
      Caption = 'Familia'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 375
      Top = 60
      Width = 60
      Height = 15
      Caption = 'Sub Familia'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object lblProv: TLabel
      Left = 23
      Top = 110
      Width = 52
      Height = 15
      Caption = 'Proveedor'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 254
      Top = 110
      Width = 33
      Height = 15
      Caption = 'Marca'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 421
      Top = 110
      Width = 82
      Height = 15
      Caption = 'Art'#237'culo ( Tipo )'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 4
      Top = 55
      Width = 787
      Height = 2
    end
    object Label8: TLabel
      Left = 366
      Top = 7
      Width = 75
      Height = 15
      Caption = 'Punto de Venta'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Bevel2: TBevel
      Left = 5
      Top = 103
      Width = 787
      Height = 2
    end
    object sbDisenoRep: TSpeedButton
      Left = 3
      Top = 125
      Width = 7
      Height = 22
      Flat = True
      OnClick = sbDisenoRepClick
    end
    object bbtOk: TBitBtn
      Left = 715
      Top = 11
      Width = 68
      Height = 32
      Caption = 'Consulta'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = bbtOkClick
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
    object dblcCia: TwwDBLookupCombo
      Left = 10
      Top = 24
      Width = 45
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'Compa'#241#237'a'#9'F'
        'CIADES'#9'40'#9'Descripci'#243'n'#9'F')
      LookupTable = DMLOG.cdsCIA
      LookupField = 'CIAID'
      Options = [loTitles]
      DropDownCount = 15
      ParentFont = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcCiaExit
      OnNotInList = dblcNotInList
    end
    object dblcGrpArti: TwwDBLookupCombo
      Left = 10
      Top = 75
      Width = 45
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'GRARID'#9'2'#9'Grupo'#9'F'
        'GRARDES'#9'40'#9'Descripcion'#9'F'
        'GRARABR'#9'15'#9'Abreviatura'#9'F')
      LookupTable = DMLOG.cdsGArti
      LookupField = 'GRARID'
      Options = [loTitles]
      ParentFont = False
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcGrpArtiExit
      OnNotInList = dblcNotInList
    end
    object dblcTipInv: TwwDBLookupCombo
      Left = 186
      Top = 24
      Width = 45
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TINID'#9'2'#9'Inventario'#9'F'
        'TINDES'#9'40'#9'Descripci'#243'n'#9'F'
        'TINABR'#9'15'#9'Abreviatura'#9'F')
      LookupTable = DMLOG.cdsTINID
      LookupField = 'TINID'
      Options = [loTitles]
      ParentFont = False
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcTipInvExit
      OnNotInList = dblcNotInList
    end
    object seAno: TSpinEdit
      Left = 542
      Top = 24
      Width = 57
      Height = 24
      MaxValue = 0
      MinValue = 0
      TabOrder = 4
      Value = 2005
    end
    object rgTipo: TRadioGroup
      Left = 613
      Top = 1
      Width = 85
      Height = 51
      Caption = 'Tipo Consulta'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Stock'
        'Importes')
      ParentFont = False
      TabOrder = 5
    end
    object dblcFAM: TwwDBLookupCombo
      Left = 186
      Top = 75
      Width = 45
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'FAMID'#9'2'#9'Grupo'#9'F'
        'FAMDES'#9'40'#9'Descripcion'#9'F')
      LookupTable = DMLOG.cdsFAM
      LookupField = 'FAMID'
      Options = [loTitles]
      ParentFont = False
      TabOrder = 6
      AutoDropDown = True
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnEnter = dblcFAMEnter
      OnExit = dblcFAMExit
      OnNotInList = dblcNotInList
    end
    object dblcSubFAM: TwwDBLookupCombo
      Left = 362
      Top = 75
      Width = 45
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'SFAMID'#9'2'#9'Grupo'#9'F'
        'SFAMDES'#9'40'#9'Descripcion'#9'F')
      LookupTable = DMLOG.cdsSUBFAM
      LookupField = 'SFAMID'
      Options = [loTitles]
      ParentFont = False
      TabOrder = 7
      AutoDropDown = True
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnEnter = dblcSubFAMEnter
      OnExit = dblcSubFAMExit
      OnNotInList = dblcNotInList
    end
    object dblcdProv: TwwDBLookupComboDlg
      Left = 15
      Top = 125
      Width = 63
      Height = 23
      CharCase = ecUpperCase
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taCenter
      Caption = 'Proveedores'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'PROV'#9'8'#9'ID'#9'F'
        'PROVDES'#9'40'#9'Descripci'#243'n'#9'F'
        'PROVABR'#9'15'#9'Abreviatura'#9'F')
      LookupField = 'PROV'
      TabOrder = 8
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcdProvExit
    end
    object dbeProv: TEdit
      Left = 78
      Top = 125
      Width = 160
      Height = 23
      Color = clBtnFace
      Enabled = False
      TabOrder = 9
    end
    object dblcdMarca: TwwDBLookupComboDlg
      Left = 245
      Top = 125
      Width = 55
      Height = 23
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'MARCA'#9'6'#9'Id'#9'F'
        'MARDES'#9'30'#9'Marca'#9'F')
      LookupField = 'MARCA'
      TabOrder = 10
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnExit = dblcdMarcaExit
    end
    object edtMarca: TEdit
      Left = 300
      Top = 125
      Width = 110
      Height = 23
      Color = clBtnFace
      Enabled = False
      TabOrder = 11
    end
    object dblcdArtTipo: TwwDBLookupComboDlg
      Left = 416
      Top = 125
      Width = 55
      Height = 23
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'TIPART'#9'6'#9'Id'#9'F'
        'TIPARTDES'#9'30'#9'Tipo de Art'#237'culo'#9'F')
      LookupField = 'TIPART'
      TabOrder = 12
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnExit = dblcdArtTipoExit
    end
    object edtTipArt: TEdit
      Left = 471
      Top = 125
      Width = 140
      Height = 23
      Color = clBtnFace
      Enabled = False
      TabOrder = 13
    end
    object dblcAlmacen: TwwDBLookupCombo
      Left = 361
      Top = 24
      Width = 45
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'ALMID'#9'2'#9'Almacen'#9'F'
        'ALMDES'#9'28'#9'Descripci'#243'n'#9'F')
      LookupTable = DMLOG.cdsALM
      LookupField = 'ALMID'
      Options = [loColLines, loRowLines, loTitles]
      ParentFont = False
      TabOrder = 14
      AutoDropDown = True
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
      OnExit = dblcAlmacenExit
    end
    object edtAlmacen: TEdit
      Left = 406
      Top = 24
      Width = 120
      Height = 23
      Color = clBtnFace
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 15
    end
    object edtTinv: TEdit
      Left = 231
      Top = 24
      Width = 120
      Height = 23
      AutoSize = False
      Color = clBtnFace
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 16
    end
    object edtCia: TEdit
      Left = 55
      Top = 24
      Width = 120
      Height = 23
      AutoSize = False
      Color = clBtnFace
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 17
    end
    object dbeGrpArti: TEdit
      Left = 55
      Top = 75
      Width = 120
      Height = 23
      AutoSize = False
      Color = clBtnFace
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 18
    end
    object dbeFAM: TEdit
      Left = 231
      Top = 75
      Width = 120
      Height = 23
      AutoSize = False
      Color = clBtnFace
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 19
    end
    object dbeSFAM: TEdit
      Left = 407
      Top = 75
      Width = 120
      Height = 23
      AutoSize = False
      Color = clBtnFace
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 20
    end
    object GroupBox1: TGroupBox
      Left = 626
      Top = 105
      Width = 158
      Height = 45
      Caption = 'Anual'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 21
      object bbtnEneJun: TBitBtn
        Left = 8
        Top = 15
        Width = 68
        Height = 25
        Hint = 'Imprimir Enero - Junio'
        Caption = 'Ene-Jun'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = bbtnEneJunClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
      end
      object bbtnJulDic: TBitBtn
        Left = 81
        Top = 15
        Width = 68
        Height = 25
        Hint = 'Imprimir Julio - Diciembre'
        Caption = 'Jul-Dic'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = bbtnJulDicClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
      end
    end
    object GroupBox2: TGroupBox
      Left = 626
      Top = 57
      Width = 158
      Height = 43
      Caption = 'Mensual'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 22
      object bbtnMes: TBitBtn
        Left = 81
        Top = 13
        Width = 68
        Height = 25
        Hint = 'Movimiento del Mes Seleccionado'
        Caption = 'Mes'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = bbtnMesClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
      end
      object seMes: TSpinEdit
        Left = 21
        Top = 15
        Width = 41
        Height = 24
        MaxLength = 2
        MaxValue = 12
        MinValue = 1
        TabOrder = 1
        Value = 12
      end
    end
    object rgPeriodo: TRadioGroup
      Left = 246
      Top = 147
      Width = 363
      Height = 43
      Caption = 'Periodo'
      Columns = 2
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        '4 '#218'ltimos A'#241'os'
        'Mensual x A'#241'o')
      ParentFont = False
      TabOrder = 23
      Visible = False
    end
    object cbDisenoRep: TCheckBox
      Left = 512
      Top = 58
      Width = 97
      Height = 17
      Caption = 'Dise'#241'o Rep'
      TabOrder = 24
      Visible = False
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 342
    Top = 108
  end
  object ppr1: TppReport
    AutoStop = False
    DataPipeline = ppdb1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 12700
    PrinterSetup.mmMarginLeft = 12700
    PrinterSetup.mmMarginRight = 12700
    PrinterSetup.mmMarginTop = 12700
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 297127
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\oaEjecuta\RTMS\LOG\Dema\MovimientoxMesStock.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 116
    Top = 119
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdb1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
  object ppdb1: TppDBPipeline
    UserName = 'db1'
    Left = 180
    Top = 119
  end
  object ppd1: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = ppr1
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 148
    Top = 119
  end
end
