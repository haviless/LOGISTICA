object FVisOCReq: TFVisOCReq
  Left = 129
  Top = 146
  BorderStyle = bsDialog
  Caption = 'Seguimiento de Ordenes de Compra'
  ClientHeight = 526
  ClientWidth = 800
  Color = 12904163
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 487
    Width = 782
    Height = 37
  end
  object pnlDetalleG: TPanel
    Left = 0
    Top = 0
    Width = 801
    Height = 239
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object stxTitulo1: TStaticText
      Left = 2
      Top = 2
      Width = 797
      Height = 19
      Align = alTop
      Alignment = taCenter
      Caption = 'Detalle de Requisici'#243'n'
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
    object dbgO: TwwDBGrid
      Left = 2
      Top = 21
      Width = 797
      Height = 216
      DisableThemesInTitle = False
      MemoAttributes = [mSizeable, mWordWrap, mGridShow, mViewOnly, mDisableDialog]
      IniAttributes.Delimiter = ';;'
      TitleColor = 10207162
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      Color = 15792632
      DataSource = dsCab
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 244
    Width = 800
    Height = 239
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object stxTitulo2: TStaticText
      Left = 2
      Top = 2
      Width = 796
      Height = 19
      Align = alTop
      Alignment = taCenter
      Caption = 'Detalle de Requisici'#243'n'
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
    object dbgD: TwwDBGrid
      Left = 2
      Top = 21
      Width = 796
      Height = 216
      DisableThemesInTitle = False
      MemoAttributes = [mSizeable, mWordWrap, mGridShow, mViewOnly, mDisableDialog]
      IniAttributes.Delimiter = ';;'
      TitleColor = 10207162
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      Color = 15792632
      DataSource = ds
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
    end
  end
  object Z2bbtnSalir: TBitBtn
    Left = 748
    Top = 490
    Width = 32
    Height = 31
    Hint = 'Cerrar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'Garamond'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
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
  object cds: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ValidateWithMask = True
    Left = 382
    Top = 90
  end
  object ds: TwwDataSource
    DataSet = cds
    Left = 382
    Top = 122
  end
  object dsCab: TwwDataSource
    DataSet = cdsCab
    Left = 558
    Top = 88
  end
  object cdsCab: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ValidateWithMask = True
    Left = 558
    Top = 54
  end
end
