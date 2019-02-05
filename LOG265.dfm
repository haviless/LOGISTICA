object FComboCab: TFComboCab
  Left = 332
  Top = 389
  Width = 520
  Height = 181
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Actualizacion de Combo'
  Color = 12904163
  Constraints.MaxHeight = 181
  Constraints.MaxWidth = 520
  Constraints.MinHeight = 181
  Constraints.MinWidth = 520
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 14
    Top = 5
    Width = 87
    Height = 19
    Caption = 'C'#243'digo Combo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 158
    Top = 5
    Width = 71
    Height = 19
    Caption = 'Descripci'#243'n'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 19
    Top = 59
    Width = 101
    Height = 19
    Caption = 'Tipo de Moneda'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dbeCodCom: TwwDBEdit
    Left = 15
    Top = 25
    Width = 80
    Height = 23
    CharCase = ecUpperCase
    DataField = 'CODCOM'
    DataSource = DMLOG.dsConsumo
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    MaxLength = 8
    ParentFont = False
    TabOrder = 0
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
    OnExit = dbeCodComExit
  end
  object dbeDesCom: TwwDBEdit
    Left = 118
    Top = 25
    Width = 380
    Height = 23
    DataField = 'DESCOM'
    DataSource = DMLOG.dsConsumo
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dblcTMon: TwwDBLookupCombo
    Left = 15
    Top = 79
    Width = 46
    Height = 23
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    CharCase = ecUpperCase
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'TMONID'#9'3'#9'Id'#9'F'
      'TMONDES'#9'30'#9'Moneda'#9'F')
    DataField = 'TMONID'
    DataSource = DMLOG.dsConsumo
    LookupTable = DMLOG.cdsTMoneda
    LookupField = 'TMONID'
    Options = [loColLines, loRowLines, loTitles]
    ParentFont = False
    TabOrder = 2
    AutoDropDown = False
    ShowButton = True
    SearchDelay = 2
    PreciseEditRegion = False
    AllowClearKey = False
    ShowMatchText = True
    OnExit = dblcTMonExit
    OnNotInList = dblcTMonNotInList
  end
  object edtTMon: TEdit
    Left = 63
    Top = 79
    Width = 120
    Height = 23
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object bbtnRegOk: TBitBtn
    Left = 424
    Top = 113
    Width = 32
    Height = 30
    Hint = 'Confirma Ingreso de Articulo'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
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
  object bbtnRegCanc: TBitBtn
    Left = 464
    Top = 113
    Width = 32
    Height = 30
    Hint = 'Cancela Ingreso de Articulo'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = bbtnRegCancClick
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
  object Panel1: TPanel
    Left = 267
    Top = 63
    Width = 208
    Height = 41
    BevelInner = bvLowered
    Color = 10207162
    Enabled = False
    TabOrder = 6
    object cbActivo: TwwCheckBox
      Left = 36
      Top = 12
      Width = 138
      Height = 17
      DisableThemes = False
      AlwaysTransparent = False
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      DisplayValueChecked = 'S'
      DisplayValueUnchecked = 'N'
      NullAndBlankState = cbUnchecked
      Caption = ' Combo Activo'
      DataField = 'ACTIVO'
      DataSource = DMLOG.dsConsumo
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
end
