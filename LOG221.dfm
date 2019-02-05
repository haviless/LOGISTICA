object FArtOCxReqs: TFArtOCxReqs
  Left = 152
  Top = 164
  Width = 788
  Height = 489
  BorderIcons = [biSystemMenu]
  Caption = 'Generaci'#243'n de Orden de Compras desde Requisiciones'
  Color = 14869218
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
  object pnlArtPend: TPanel
    Left = 0
    Top = 0
    Width = 780
    Height = 229
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 14869218
    TabOrder = 0
    object dbgArtPend: TwwDBGrid
      Left = 2
      Top = 2
      Width = 776
      Height = 221
      DisableThemesInTitle = False
      Selected.Strings = (
        'ARTID'#9'8'#9'Articulo'
        'ARTDES'#9'28'#9'Detalle'
        'TIPOADQ'#9'3'#9'Tipo~Adq'
        'RXACNTSG'#9'8'#9'Cant. Solic.~Med. Gen.'
        'RXACNTAG'#9'8'#9'Cant. Atend.~Med. Gen.'
        'RXASALDOG'#9'8'#9'Saldo~U.M.G'
        'UNMIDG'#9'3'#9'U. M.~Gen'
        'RXACNTSU'#9'9'#9'Cant. Solic.~Med. Unit'
        'RXACNTAU'#9'9'#9'Cant. Atend.~Med. Unit'
        'RXASALDOU'#9'7'#9'Saldo~U.M.U.'
        'UNMIDU'#9'3'#9'U.M.~Unit')
      IniAttributes.Delimiter = ';;'
      TitleColor = 7566265
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alTop
      Color = 15792632
      DataSource = DMLOG.dsArtPendX
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
      TitleFont.Color = clWhite
      TitleFont.Height = -11
      TitleFont.Name = 'Comic Sans MS'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = True
      OnTitleButtonClick = dbgArtPendTitleButtonClick
      OnEnter = dbgArtPendEnter
    end
  end
  object pnlDetRqs: TPanel
    Left = 0
    Top = 229
    Width = 780
    Height = 226
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'pnlDetalle'
    Color = 10207162
    TabOrder = 1
    object dbgRqsArtX: TwwDBGrid
      Left = 2
      Top = 22
      Width = 776
      Height = 175
      DisableThemesInTitle = False
      Selected.Strings = (
        'RQSID'#9'9'#9'N'#186' Req.'#9'F'
        'DRQSID'#9'5'#9'N'#186'~Item'#9'F'
        'CCOSID'#9'7'#9'Centro de~Costos'#9'F'
        'CCOSDES'#9'25'#9'Centro de Costos'#9'F'
        'DRQSCNSG'#9'7'#9'Cant. Sol.~General'#9'F'
        'DRQSCNAG'#9'6'#9'Cant. At.~General'#9'F'
        'DRQSSLDG'#9'7'#9'Cant. Sld.~General'#9'F'
        'UNMIDG'#9'7'#9'Unid.Med~General'#9'F'
        'DRQSCNSU'#9'7'#9'Cant. Sol.~Unitaria'#9'F'
        'DRQSCNAU'#9'6'#9'Cant. At.~Unitaria'#9'F'
        'DRQSSLDU'#9'7'#9'Cant. Sld.~Unitaria'#9'F'
        'UNMIDU'#9'7'#9'Unid.Med.~Unitaria'#9'F'
        'PRIOID'#9'6'#9'Prioridad'#9'F'
        'RQSEST'#9'10'#9'Estado'#9'F'
        'RQSFATE'#9'10'#9'F.Atenci'#243'n'#9'F'
        'RQSFREG'#9'10'#9'F.Registro'#9'F'
        'RQSFREQ'#9'10'#9'Fecha de~Requisici'#243'n'#9'F')
      MemoAttributes = [mGridShow, mViewOnly, mDisableDialog]
      IniAttributes.Delimiter = ';;'
      TitleColor = 7566265
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alTop
      Color = 15792632
      DataSource = DMLOG.dsRqsArtX
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      KeyOptions = [dgEnterToTab]
      Options = [dgTitles, dgIndicator, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWhite
      TitleFont.Height = -11
      TitleFont.Name = 'Comic Sans MS'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
      UseTFields = False
      OnDblClick = dbgRqsArtXDblClick
      OnEnter = dbgRqsArtXEnter
    end
    object Panel2: TPanel
      Left = 2
      Top = 187
      Width = 776
      Height = 37
      Align = alBottom
      BevelOuter = bvNone
      Color = 14869218
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object bbtnCerrar: TBitBtn
        Left = 394
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
        Left = 346
        Top = 4
        Width = 36
        Height = 27
        Default = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ModalResult = 1
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
      Width = 776
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
  end
  object pnlOrden: TPanel
    Left = 238
    Top = 254
    Width = 257
    Height = 81
    BevelInner = bvRaised
    BevelWidth = 2
    Color = 14869218
    TabOrder = 2
    Visible = False
    object lblBusca: TLabel
      Left = 18
      Top = 15
      Width = 49
      Height = 16
      Caption = 'Buscar'
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
      Height = 21
      DataSource = DMLOG.dsArtPendX
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
  object pnlDetxReqs: TPanel
    Left = 47
    Top = 117
    Width = 721
    Height = 261
    BevelInner = bvRaised
    BevelOuter = bvLowered
    BevelWidth = 2
    BorderStyle = bsSingle
    TabOrder = 3
    Visible = False
    object dbgDReqs: TwwDBGrid
      Left = 6
      Top = 6
      Width = 704
      Height = 212
      DisableThemesInTitle = False
      Selected.Strings = (
        'DRQSID'#9'5'#9'N'#186' '
        'ARTID'#9'17'#9'C'#243'digo~Art'#237'culo'
        'DRQSOBS'#9'55'#9'Observacion'
        'UNMIDG'#9'3'#9'Unidad~General'
        'DRQSCNAG'#9'10'#9'Cant. At. ~General'
        'DRQSCNSG'#9'5'#9'Cant. Sol. ~General')
      MemoAttributes = [mGridShow, mViewOnly, mDisableDialog]
      IniAttributes.Delimiter = ';;'
      TitleColor = 7566265
      FixedCols = 0
      ShowHorzScrollBar = True
      Color = 15792632
      DataSource = DMLOG.dsReporte
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
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Comic Sans MS'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
    end
    object bbtnCerrarDetReqs: TBitBtn
      Left = 322
      Top = 224
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
      OnClick = bbtnCerrarDetReqsClick
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
end
