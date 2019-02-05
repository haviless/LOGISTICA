object FEvalProfSerAct: TFEvalProfSerAct
  Left = 205
  Top = 191
  Width = 758
  Height = 488
  BorderIcons = [biSystemMenu]
  Caption = 'FEvalProfSerAct'
  Color = 12904163
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 750
    Height = 161
    Align = alTop
    Color = 10207162
    TabOrder = 0
    object dbgSolCot: TwwDBGrid
      Left = 1
      Top = 1
      Width = 318
      Height = 159
      DisableThemesInTitle = False
      Selected.Strings = (
        'SCCID'#9'10'#9'N'#186' de~Solicitud'
        'SCCFSOL'#9'10'#9'Fecha de~Solicitud'
        'LKTIPOSOL'#9'24'#9'Tipo Solicitud~de Cotizaci'#243'n')
      IniAttributes.Delimiter = ';;'
      TitleColor = 11974251
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alLeft
      Color = clWhite
      DataSource = DM1.dsSolCot
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs]
      ParentFont = False
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
    end
    object Z2bbtnOkSuma: TBitBtn
      Left = 328
      Top = 11
      Width = 32
      Height = 31
      Hint = 'Sumatoria por proveedor'
      Default = True
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333333333333333333FFFFFFFFFFF33330000000000
        03333377777777777F33333003333330033333377FF333377F33333300333333
        0333333377FF33337F3333333003333303333333377FF3337333333333003333
        333333333377FF3333333333333003333333333333377FF33333333333330033
        3333333333337733333333333330033333333333333773333333333333003333
        33333333337733333F3333333003333303333333377333337F33333300333333
        03333333773333337F33333003333330033333377FFFFFF77F33330000000000
        0333337777777777733333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object Z2bbtnOkPrint: TBitBtn
      Left = 364
      Top = 11
      Width = 32
      Height = 31
      Hint = 'Imprime Solicitud'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
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
  end
  object dbgProSolCot: TwwDBGrid
    Left = 0
    Top = 161
    Width = 750
    Height = 280
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = 11974251
    FixedCols = 0
    ShowHorzScrollBar = True
    Align = alTop
    TabOrder = 1
    TitleAlignment = taLeftJustify
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Comic Sans MS'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
  end
end
