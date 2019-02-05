object FArtOCxReqsTot: TFArtOCxReqsTot
  Left = 199
  Top = 192
  Width = 791
  Height = 549
  BorderIcons = [biSystemMenu]
  Caption = 'Generacion de Orden de Compras desde Requisiciones'
  Color = 10207162
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Courier New'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object pnlArtPend: TPanel
    Left = 0
    Top = 0
    Width = 783
    Height = 229
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 10207162
    TabOrder = 0
    object dbgArtPend: TwwDBGrid
      Left = 2
      Top = 2
      Width = 779
      Height = 225
      DisableThemesInTitle = False
      Selected.Strings = (
        'CIAID'#9'2'#9'Cia'
        'LOCID'#9'2'#9'Loc'
        'RQSID'#9'9'#9'N'#186'~Requis.'#9'F'
        'TIPOADQ'#9'3'#9'Tipo~Adq'
        'PRIOID'#9'2'#9'Pri'
        'RQSVISADOR'#9'5'#9'Visador'
        'RQSVISHREG'#9'15'#9'Fecha~Visado'#9'F'
        'CCOSDES'#9'10'#9'Centro de~Costo'#9'F'
        'RQSUSER'#9'6'#9'Reque'
        'RQSFREG'#9'9'#9'Fecha~Requisici'#243'n'
        'URQACEPUSR'#9'6'#9'Jefatura~Usuaria'
        'URQACEPHREG'#9'9'#9'F. Jefatura~Usuaria'
        'URQUSR'#9'7'#9'Solicitado'
        'URQHREG'#9'9'#9'Fecha~Solictado')
      IniAttributes.Delimiter = ';;'
      TitleColor = 11974251
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      Color = 15792632
      DataSource = DMLOG.dsArtPendXTot
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
      TitleButtons = True
      UseTFields = False
      OnTitleButtonClick = dbgArtPendTitleButtonClick
      OnEnter = dbgArtPendEnter
    end
  end
  object pnlDetRqs: TPanel
    Left = 0
    Top = 229
    Width = 783
    Height = 286
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 10207162
    TabOrder = 1
    object Panel2: TPanel
      Left = 2
      Top = 247
      Width = 779
      Height = 37
      Align = alBottom
      BevelOuter = bvNone
      Color = 10207162
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object bbtnCerrar: TBitBtn
        Left = 384
        Top = 4
        Width = 36
        Height = 27
        Cancel = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ModalResult = 2
        ParentFont = False
        TabOrder = 0
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
      object bbtnAceptar: TBitBtn
        Left = 336
        Top = 4
        Width = 36
        Height = 27
        Default = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
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
    end
    object pnlTitulo5: TPanel
      Left = 2
      Top = 2
      Width = 779
      Height = 20
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'Detalle de Requisiciones'
      Color = clAppWorkSpace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object dbgRqsArtX: TwwDBGrid
      Left = 2
      Top = 18
      Width = 779
      Height = 229
      DisableThemesInTitle = False
      Selected.Strings = (
        'DRQSID'#9'3'#9'N'#186'~Item'#9'F'
        'ARTID'#9'8'#9'Articulo'#9'F'
        'ARTDES'#9'32'#9'Detalle'#9'F'
        'RQSEST'#9'9'#9'Estado'#9'F'
        'DRQSCNSG'#9'6'#9'Cant. Sol.~General'#9'F'
        'DRQSCNAG'#9'6'#9'Cant. At.~General'#9'F'
        'RXACNTSG'#9'7'#9'Cant. Sld.~General'#9'F'
        'UNMIDG'#9'5'#9'U. Med.~General'#9'F'
        'DRQSCNSU'#9'7'#9'Cant. Sol.~Unitaria'#9'F'
        'DRQSCNAU'#9'6'#9'Cant. At.~Unitaria'#9'F'
        'RXACNTSU'#9'7'#9'Cant. Sld.~Unitaria'#9'F'
        'UNMIDU'#9'6'#9'U. Med.~Unitaria'#9'F'
        'RQSFATE'#9'10'#9'Fecha de~Atenci'#243'n'#9'F'
        'RQSFREQ'#9'10'#9'Fecha de~Requisici'#243'n'#9'F')
      MemoAttributes = [mGridShow, mViewOnly, mDisableDialog]
      IniAttributes.Delimiter = ';;'
      TitleColor = 11974251
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alBottom
      Color = 15792632
      DataSource = DMLOG.dsRqsArtXTot
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      KeyOptions = [dgEnterToTab]
      Options = [dgTitles, dgIndicator, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
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
  end
  object pnlOrden: TPanel
    Left = 238
    Top = 230
    Width = 257
    Height = 81
    BevelInner = bvRaised
    BevelWidth = 2
    Color = 12838627
    TabOrder = 2
    Visible = False
    object lblBusca: TLabel
      Left = 18
      Top = 15
      Width = 157
      Height = 16
      Caption = 'Busca por Requisici'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel2: TBevel
      Left = 12
      Top = 35
      Width = 235
      Height = 2
    end
    object isBusca: TwwIncrementalSearch
      Left = 21
      Top = 45
      Width = 220
      Height = 22
      DataSource = DMLOG.dsArtPendXTot
      SearchField = 'RQSID'
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object btnSalir: TBitBtn
      Left = 232
      Top = 6
      Width = 20
      Height = 17
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnSalirClick
      Glyph.Data = {
        7A010000424D7A0100000000000036000000280000000C000000090000000100
        18000000000044010000C40E0000C40E00000000000000000000C6C3C6C6C3C6
        C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3
        C6C6C3C6000000000000C6C3C6C6C3C6C6C3C6C6C3C6000000000000C6C3C6C6
        C3C6C6C3C6C6C3C6C6C3C6000000000000C6C3C6C6C3C6000000000000C6C3C6
        C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6000000000000000000000000C6C3
        C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6000000000000C6
        C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6000000000000
        000000000000C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C60000000000
        00C6C3C6C6C3C6000000000000C6C3C6C6C3C6C6C3C6C6C3C6C6C3C600000000
        0000C6C3C6C6C3C6C6C3C6C6C3C6000000000000C6C3C6C6C3C6C6C3C6C6C3C6
        C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6}
    end
  end
end
