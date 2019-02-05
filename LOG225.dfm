object FNegDesdeArt: TFNegDesdeArt
  Left = 213
  Top = 122
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Desde Maestro de Art'#237'culos'
  ClientHeight = 503
  ClientWidth = 730
  Color = 10207162
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 15
  object lblGrArtID: TLabel
    Left = 189
    Top = 0
    Width = 91
    Height = 15
    Caption = 'L'#237'nea de Producto'
  end
  object lblFAM: TLabel
    Left = 366
    Top = 0
    Width = 37
    Height = 15
    Caption = 'Familia'
  end
  object lblSUBFAM: TLabel
    Left = 542
    Top = 0
    Width = 60
    Height = 15
    Caption = 'Sub Familia'
  end
  object Label1: TLabel
    Left = 7
    Top = 0
    Width = 49
    Height = 15
    Caption = 'Compa'#241#237'a'
  end
  object dbgArti: TwwDBGrid
    Left = 3
    Top = 41
    Width = 724
    Height = 427
    DisableThemesInTitle = False
    Selected.Strings = (
      'ARTID'#9'8'#9'Articulo'#9'F'
      'ARTDES'#9'60'#9'Detalle'#9'F'
      'UNMIDG'#9'5'#9'U. Med.~General'#9'F'
      'UNMIDU'#9'6'#9'U. Med.~Unitaria'#9'F')
    MemoAttributes = [mGridShow, mViewOnly, mDisableDialog]
    IniAttributes.Delimiter = ';;'
    TitleColor = 11974251
    FixedCols = 0
    ShowHorzScrollBar = True
    Color = 15792632
    DataSource = DMLOG.dsArti
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    KeyOptions = [dgEnterToTab]
    MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
    Options = [dgTitles, dgIndicator, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentFont = False
    ReadOnly = True
    TabOrder = 8
    TitleAlignment = taCenter
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Comic Sans MS'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = False
    UseTFields = False
  end
  object BitBtn1: TBitBtn
    Left = 281
    Top = 476
    Width = 75
    Height = 25
    Caption = '&OK'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 9
    OnClick = BitBtn1Click
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
  object BitBtn2: TBitBtn
    Left = 373
    Top = 476
    Width = 75
    Height = 25
    Caption = '&Cancel'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
  object dblcGrpArti: TwwDBLookupCombo
    Left = 189
    Top = 14
    Width = 49
    Height = 23
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'GRARID'#9'15'#9'Grupos'#9'F'
      'GRARDES'#9'40'#9'Descripci'#243'n'#9'F')
    LookupTable = DMLOG.cdsGArti
    LookupField = 'GRARID'
    Options = [loColLines, loTitles]
    DropDownCount = 15
    TabOrder = 2
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    OnEnter = dblcGrpArtiEnter
    OnExit = dblcGrpArtiExit
    OnNotInList = NotInList
  end
  object dbeGrpArti: TwwDBEdit
    Left = 239
    Top = 14
    Width = 125
    Height = 23
    CharCase = ecUpperCase
    Enabled = False
    ReadOnly = True
    TabOrder = 3
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dblcFAM: TwwDBLookupCombo
    Left = 366
    Top = 14
    Width = 49
    Height = 23
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'FAMID'#9'3'#9'ID'#9'F'
      'FAMDES'#9'40'#9'Descripci'#243'n'#9'F')
    LookupTable = DMLOG.cdsFAM
    LookupField = 'FAMID'
    Options = [loColLines, loTitles]
    DropDownCount = 15
    TabOrder = 4
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    OnEnter = dblcFAMEnter
    OnExit = dblcFAMExit
    OnNotInList = NotInList
  end
  object dbeFAM: TwwDBEdit
    Left = 416
    Top = 14
    Width = 125
    Height = 23
    CharCase = ecUpperCase
    Enabled = False
    ReadOnly = True
    TabOrder = 5
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dblcSUBFAM: TwwDBLookupCombo
    Left = 542
    Top = 14
    Width = 54
    Height = 23
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'SFAMID'#9'8'#9'Id'#9'F'
      'SFAMDES'#9'40'#9'Sub-Familia'#9'F')
    LookupTable = DMLOG.cdsSUBFAM
    LookupField = 'SFAMID'
    Options = [loColLines, loTitles]
    DropDownCount = 12
    TabOrder = 6
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    OnEnter = dblcSUBFAMEnter
    OnExit = dblcSUBFAMExit
    OnNotInList = NotInList
  end
  object dbeSFAM: TwwDBEdit
    Left = 598
    Top = 14
    Width = 125
    Height = 23
    CharCase = ecUpperCase
    Enabled = False
    ReadOnly = True
    TabOrder = 7
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dblcCia: TwwDBLookupCombo
    Left = 7
    Top = 14
    Width = 53
    Height = 23
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'CIAID'#9'2'#9'Compa'#241#237'a'#9'F'
      'CIADES'#9'40'#9'Descripci'#243'n'#9'F')
    LookupTable = DMLOG.cdsCIA
    LookupField = 'CIAID'
    Options = [loTitles]
    DropDownCount = 15
    TabOrder = 0
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    OnEnter = dblcCiaEnter
    OnExit = dblcCiaExit
    OnNotInList = NotInList
  end
  object dbeCIA: TwwDBEdit
    Left = 62
    Top = 14
    Width = 125
    Height = 23
    Enabled = False
    TabOrder = 1
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
end
