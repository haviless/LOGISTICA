object FNegDesdeReq: TFNegDesdeReq
  Left = 212
  Top = 160
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Desde Requisiciones'
  ClientHeight = 504
  ClientWidth = 765
  Color = 10207162
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 9
    Top = 0
    Width = 49
    Height = 15
    Caption = 'Compa'#241#237'a'
  end
  object dbgRqsArtX: TwwDBGrid
    Left = 1
    Top = 44
    Width = 761
    Height = 426
    DisableThemesInTitle = False
    Selected.Strings = (
      'RQSID'#9'6'#9'N'#186'~Req.'#9'F'
      'DRQSID'#9'3'#9'N'#186'~Item'#9'F'
      'ARTID'#9'8'#9'Articulo'#9'F'
      'ARTDES'#9'32'#9'Detalle'#9'F'
      'GRARDES'#9'10'#9'L'#237'nea'#9'F'
      'RQSEST'#9'9'#9'Estado'#9'F'
      'DRQSCNSG'#9'6'#9'Cant. Sol.~General'#9'F'
      'UNMIDG'#9'5'#9'U. Med.~General'#9'F'
      'DRQSCNSU'#9'7'#9'Cant. Sol.~Unitaria'#9'F'
      'UNMIDU'#9'6'#9'U. Med.~Unitaria'#9'F'
      'RQSFREQ'#9'10'#9'Fecha de~Requisici'#243'n'#9'F')
    MemoAttributes = [mGridShow, mViewOnly, mDisableDialog]
    IniAttributes.Delimiter = ';;'
    TitleColor = 11974251
    FixedCols = 0
    ShowHorzScrollBar = True
    Color = 15792632
    DataSource = DMLOG.dsRqsArtXTot
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
    TabOrder = 0
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
    Left = 299
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
    TabOrder = 1
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
    Left = 391
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
    TabOrder = 2
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
  object dblcCia: TwwDBLookupCombo
    Left = 7
    Top = 16
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
    TabOrder = 3
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
    Top = 16
    Width = 125
    Height = 23
    Enabled = False
    TabOrder = 4
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
end
