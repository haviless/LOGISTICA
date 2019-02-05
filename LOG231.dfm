object FConsultaCXP: TFConsultaCXP
  Left = 358
  Top = 197
  Width = 629
  Height = 387
  Caption = 'Consulta seguimiento de la Orden de Compra en Contabilidad'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bbtnConsultar: TBitBtn
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Consultar'
    TabOrder = 0
    OnClick = bbtnConsultarClick
  end
  object pcConsultaSeguimOC: TPageControl
    Left = 8
    Top = 40
    Width = 593
    Height = 297
    ActivePage = tsRegistroCXP
    TabOrder = 1
    object tsSolicOPago: TTabSheet
      Caption = 'Solic.O.Pago'
      object dbgSolicOPago: TwwDBGrid
        Left = 0
        Top = 39
        Width = 585
        Height = 230
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alBottom
        KeyOptions = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ReadOnly = True
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = True
        OnTitleButtonClick = dbgSolicOPagoTitleButtonClick
      end
    end
    object tsRegistroCXP: TTabSheet
      Caption = 'Registro CXP'
      ImageIndex = 1
      object dbgRegCxP: TwwDBGrid
        Left = 0
        Top = 39
        Width = 585
        Height = 230
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alBottom
        KeyOptions = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = True
        OnCalcCellColors = dbgRegCxPCalcCellColors
        OnTitleButtonClick = dbgRegCxPTitleButtonClick
        OnDblClick = dbgRegCxPDblClick
      end
      object bbtnTodasLasProv: TBitBtn
        Left = 88
        Top = 8
        Width = 129
        Height = 25
        Caption = 'Todas las Provisiones'
        TabOrder = 1
        Visible = False
        OnClick = bbtnTodasLasProvClick
      end
    end
    object tsPagos: TTabSheet
      Caption = 'Pagos'
      ImageIndex = 2
      object dbgPagos: TwwDBGrid
        Left = 0
        Top = 39
        Width = 585
        Height = 230
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alBottom
        KeyOptions = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ReadOnly = True
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
      end
    end
  end
end
