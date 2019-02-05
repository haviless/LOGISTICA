object FComboDet: TFComboDet
  Left = 354
  Top = 259
  Width = 522
  Height = 258
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Detalle del Combo'
  Color = 12904163
  Constraints.MaxHeight = 258
  Constraints.MaxWidth = 522
  Constraints.MinHeight = 258
  Constraints.MinWidth = 522
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
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 4
    Top = 2
    Width = 506
    Height = 53
    Color = 10207162
    TabOrder = 0
    object Label2: TLabel
      Left = 24
      Top = 5
      Width = 37
      Height = 13
      Caption = 'Art'#237'culo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object dblcdArticulo: TwwDBLookupComboDlg
      Left = 12
      Top = 20
      Width = 85
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Articulos'
      MaxWidth = 0
      MaxHeight = 209
      SearchDelay = 2
      Selected.Strings = (
        'ARTID'#9'10'#9'Articulo'#9'F'
        'ARTDES'#9'40'#9'Descripci'#243'n'#9'F'
        'GRARID'#9'3'#9'GRARID'#9'F'
        'FAMID'#9'3'#9'FAMID'#9'F'
        'SFAMID'#9'8'#9'SFAMID'#9'F'
        'UNMIDG'#9'2'#9'UNMIDG'#9'F')
      DataField = 'ARTID'
      DataSource = DMLOG.dsNegociacion
      LookupTable = DMLOG.cdsArti
      LookupField = 'ARTID'
      ParentFont = False
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnExit = dblcdArticuloExit
    end
    object dbeArt: TwwDBEdit
      Left = 102
      Top = 20
      Width = 389
      Height = 23
      DataField = 'ARTDES'
      DataSource = DMLOG.dsNegociacion
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  object pnlDato: TPanel
    Left = 101
    Top = 60
    Width = 409
    Height = 83
    Color = 10207162
    TabOrder = 1
    object Label48: TLabel
      Left = 18
      Top = 34
      Width = 35
      Height = 13
      Caption = 'Utilidad'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label49: TLabel
      Left = 92
      Top = 34
      Width = 8
      Height = 13
      Caption = '%'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label50: TLabel
      Left = 133
      Top = 20
      Width = 61
      Height = 13
      Caption = 'Precio Venta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label54: TLabel
      Left = 230
      Top = 34
      Width = 27
      Height = 13
      Caption = 'I.G.V.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label55: TLabel
      Left = 335
      Top = 34
      Width = 58
      Height = 13
      Caption = 'Incluido IGV'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label56: TLabel
      Left = 296
      Top = 34
      Width = 8
      Height = 13
      Caption = '%'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label68: TLabel
      Left = 324
      Top = 20
      Width = 79
      Height = 13
      Caption = 'Precio al Publico'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label62: TLabel
      Left = 146
      Top = 34
      Width = 36
      Height = 13
      Caption = 'Sin IGV'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblTM: TLabel
      Left = 9
      Top = 3
      Width = 175
      Height = 16
      Caption = 'DOLARES AMERICANOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbeUtilidad: TwwDBEdit
      Left = 7
      Top = 50
      Width = 60
      Height = 23
      DataField = 'UTILIDAD'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = dbeUtilidadExit
    end
    object dbePV: TwwDBEdit
      Left = 129
      Top = 50
      Width = 70
      Height = 23
      DataField = 'PREVEN'
      DataSource = DMLOG.dsNegociacion
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = dbePVExit
    end
    object dbePorUti: TwwDBEdit
      Left = 75
      Top = 50
      Width = 42
      Height = 23
      DataField = 'PORUTI'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = dbePorUtiExit
    end
    object dbeIGVPV: TwwDBEdit
      Left = 213
      Top = 50
      Width = 60
      Height = 23
      DataField = 'IGVPV'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbePVIGV: TwwDBEdit
      Left = 328
      Top = 50
      Width = 70
      Height = 23
      DataField = 'PREPUB'
      DataSource = DMLOG.dsNegociacion
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = dbePVIGVExit
    end
    object dbeIGV: TwwDBEdit
      Left = 279
      Top = 50
      Width = 42
      Height = 23
      DataField = 'IGV'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  object Panel3: TPanel
    Left = 4
    Top = 148
    Width = 506
    Height = 73
    Color = 11586760
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 28
      Top = 8
      Width = 154
      Height = 57
      Caption = 'Tipo de Cambio del Dia'
      Color = 10207162
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      object dbeTCD: TwwDBEdit
        Left = 46
        Top = 23
        Width = 60
        Height = 24
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object GroupBox2: TGroupBox
      Left = 208
      Top = 8
      Width = 106
      Height = 57
      Caption = ' Stock '
      Color = 10207162
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 1
      object dbeStock: TwwDBEdit
        Left = 22
        Top = 23
        Width = 60
        Height = 24
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object bbtnRegOk: TBitBtn
      Left = 417
      Top = 33
      Width = 35
      Height = 32
      Hint = 'Confirma Ingreso de Articulo'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
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
      Left = 457
      Top = 33
      Width = 35
      Height = 32
      Hint = 'Cancela Ingreso de Articulo'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
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
  end
  object Panel4: TPanel
    Left = 4
    Top = 60
    Width = 95
    Height = 83
    Color = 11586760
    Enabled = False
    TabOrder = 3
    object Label3: TLabel
      Left = 31
      Top = 34
      Width = 27
      Height = 13
      Caption = 'Costo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblObsequio: TLabel
      Left = 2
      Top = 6
      Width = 92
      Height = 24
      Caption = 'Obsequio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object dbeCF: TwwDBEdit
      Left = 10
      Top = 50
      Width = 75
      Height = 23
      DataField = 'CFS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
end
