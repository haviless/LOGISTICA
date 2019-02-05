object FCombos: TFCombos
  Left = 296
  Top = 74
  Width = 720
  Height = 540
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Mantenimiento de Combos'
  Color = 12904163
  Constraints.MaxHeight = 540
  Constraints.MaxWidth = 720
  Constraints.MinHeight = 540
  Constraints.MinWidth = 720
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDet: TPanel
    Left = 6
    Top = 252
    Width = 700
    Height = 251
    Color = 10207162
    TabOrder = 0
    object Label1: TLabel
      Left = 18
      Top = 49
      Width = 113
      Height = 16
      Caption = 'Lista de Precios'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 308
      Top = 49
      Width = 182
      Height = 16
      Caption = 'Precio al Publico (Combo)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 516
      Top = 49
      Width = 158
      Height = 16
      Caption = 'Nuevo Precio (Combo)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbgDet: TwwDBGrid
      Left = 15
      Top = 96
      Width = 671
      Height = 148
      DisableThemesInTitle = False
      Selected.Strings = (
        'ARTID'#9'12'#9'C'#243'digo~Combo'#9#9
        'ARTDES'#9'50'#9'Descripci'#243'n de Combo'#9#9
        'TMONID'#9'4'#9'TM'#9#9
        'PREVEN'#9'15'#9'Precio~S/IGV'#9#9
        'PREPUB'#9'15'#9'Precio~P'#250'blico'#9#9)
      IniAttributes.Delimiter = ';;'
      TitleColor = 10207162
      FixedCols = 0
      ShowHorzScrollBar = True
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
      OnDblClick = dbgDetDblClick
      OnKeyDown = dbgDetKeyDown
      FooterColor = 10207162
      FooterHeight = 25
      object dbgDetIButton: TwwIButton
        Left = 0
        Top = 0
        Width = 30
        Height = 30
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
        OnClick = dbgDetIButtonClick
      end
    end
    object dblcLPrecio: TwwDBLookupCombo
      Left = 15
      Top = 68
      Width = 58
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TLISTAID'#9'3'#9'Id'#9'F'
        'TLISTADES'#9'20'#9'Lista'#9'F'
        'TLISTAVIG'#9'10'#9'Vigencia'#9'F')
      LookupTable = DMLOG.cdsTLista
      LookupField = 'TLISTAID'
      Options = [loColLines, loRowLines, loTitles]
      ParentFont = False
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
      OnEnter = dblcLPrecioEnter
      OnExit = dblcLPrecioExit
    end
    object edtLPrecio: TEdit
      Left = 75
      Top = 68
      Width = 150
      Height = 23
      Color = 12904163
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object bbtnRegOk: TBitBtn
      Left = 241
      Top = 62
      Width = 32
      Height = 30
      Hint = 'Mostrar Detalle de Combo'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = bbtnRegOkClick
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
    object Panel1: TPanel
      Left = 15
      Top = 5
      Width = 673
      Height = 39
      Color = 10207162
      Enabled = False
      TabOrder = 4
      object dbeCod: TwwDBEdit
        Left = 12
        Top = 7
        Width = 80
        Height = 26
        Color = 12904163
        DataField = 'CODCOM'
        DataSource = DMLOG.dsConsumo
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeNombre: TwwDBEdit
        Left = 104
        Top = 7
        Width = 529
        Height = 26
        Color = 12904163
        DataField = 'DESCOM'
        DataSource = DMLOG.dsConsumo
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object dbePrePub: TwwDBEdit
      Left = 347
      Top = 68
      Width = 100
      Height = 24
      Color = 12904163
      DataField = 'PREPUB'
      DataSource = DMLOG.dsConsumo
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeImpRec: TwwDBEdit
      Left = 548
      Top = 68
      Width = 91
      Height = 24
      DataField = 'IMPORTE'
      DataSource = DMLOG.dsQry10
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object BitBtn1: TBitBtn
      Left = 656
      Top = 68
      Width = 28
      Height = 25
      Hint = 'Recalcular Precio de Combo'
      Caption = 'R'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = BitBtn1Click
    end
  end
  object pnlCab: TPanel
    Left = 6
    Top = 2
    Width = 700
    Height = 246
    Color = 10207162
    TabOrder = 1
    object Label14: TLabel
      Left = 17
      Top = 5
      Width = 71
      Height = 16
      Caption = 'Compa'#241'ia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 230
      Top = 5
      Width = 83
      Height = 16
      Caption = 'T.Inventario'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbgCab: TwwDBGrid
      Left = 16
      Top = 50
      Width = 670
      Height = 183
      DisableThemesInTitle = False
      Selected.Strings = (
        'CODCOM'#9'12'#9'C'#243'digo~Combo'#9#9
        'DESCOM'#9'50'#9'Descripci'#243'n de Combo'#9#9
        'TMONID'#9'08'#9'TM'#9#9
        'ACTIVO'#9'08'#9'Activo~S/N'#9#9)
      IniAttributes.Delimiter = ';;'
      TitleColor = 10207162
      OnRowChanged = dbgCabRowChanged
      FixedCols = 0
      ShowHorzScrollBar = True
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
      OnDblClick = dbgCabDblClick
      object dbgCabIButton: TwwIButton
        Left = 0
        Top = 0
        Width = 30
        Height = 30
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
        OnClick = dbgCabIButtonClick
      end
    end
    object dblcCia: TwwDBLookupCombo
      Left = 16
      Top = 22
      Width = 50
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'C'#237'a'#9'F'
        'CIADES'#9'40'#9'Raz'#243'n Social'#9'F')
      LookupTable = DMLOG.cdsCIA
      LookupField = 'CIAID'
      Options = [loColLines, loRowLines, loTitles]
      DropDownCount = 15
      ParentFont = False
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
      OnExit = dblcCiaExit
    end
    object edtCia: TEdit
      Left = 67
      Top = 22
      Width = 150
      Height = 23
      Color = 12904163
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object dblcTinid: TwwDBLookupCombo
      Left = 229
      Top = 22
      Width = 50
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TINID'#9'2'#9'T.Inventario'#9'F'
        'TINDES'#9'28'#9'Descripci'#243'n'#9'F')
      LookupTable = DMLOG.cdsTINID
      LookupField = 'TINID'
      Options = [loColLines, loRowLines, loTitles]
      DropDownCount = 15
      ParentFont = False
      TabOrder = 3
      AutoDropDown = False
      ShowButton = True
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcTinidExit
    end
    object edtTinid: TEdit
      Left = 280
      Top = 22
      Width = 150
      Height = 23
      Color = 12904163
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object BitBtn2: TBitBtn
      Left = 559
      Top = 14
      Width = 125
      Height = 31
      Caption = 'Activa/DesActiva'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = BitBtn2Click
    end
    object bbtnMostrar: TBitBtn
      Left = 455
      Top = 14
      Width = 75
      Height = 31
      Caption = 'Mostrar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = bbtnMostrarClick
    end
  end
end
