object FEvalProf: TFEvalProf
  Left = -12
  Top = -2
  Width = 812
  Height = 612
  HorzScrollBar.Tracking = True
  VertScrollBar.Tracking = True
  Caption = 'Evaluaci'#243'n de Proforma'
  Color = 12904163
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlSolCot: TPanel
    Left = 0
    Top = 0
    Width = 804
    Height = 217
    Align = alTop
    AutoSize = True
    BevelInner = bvRaised
    BiDiMode = bdLeftToRight
    BorderWidth = 1
    BorderStyle = bsSingle
    Color = 10207162
    Constraints.MaxWidth = 900
    UseDockManager = False
    FullRepaint = False
    ParentBiDiMode = False
    TabOrder = 0
    object dbgSolCot: TwwDBGrid
      Left = 3
      Top = 24
      Width = 318
      Height = 186
      DisableThemesInTitle = False
      Selected.Strings = (
        'SCCID'#9'10'#9'N'#186' de~Solicitud'
        'SCCFSOL'#9'10'#9'Fecha de~Solicitud'
        'LKTIPOSOL'#9'24'#9'Tipo Solicitud~de Cotizaci'#243'n')
      IniAttributes.Delimiter = ';;'
      TitleColor = 10207162
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alLeft
      Color = 15792632
      DataSource = DMLOG.dsSolCot
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
      OnDblClick = dbgSolCotDblClick
    end
    object Z2bbtnOkSuma: TBitBtn
      Left = 352
      Top = 100
      Width = 32
      Height = 31
      Hint = 'Sumatoria por proveedor'
      Default = True
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = Z2bbtnOkSumaClick
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
      Left = 397
      Top = 100
      Width = 32
      Height = 31
      Hint = 'Imprime Solicitud'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = Z2bbtnOkPrintClick
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
    object stxTitulo3: TStaticText
      Left = 3
      Top = 3
      Width = 794
      Height = 21
      Align = alTop
      Alignment = taCenter
      BorderStyle = sbsSunken
      Caption = 'Evaluaci'#243'n de Proformas'
      Color = clHighlight
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clHighlightText
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      TabOrder = 3
    end
  end
  object DBCtrlGrid1: TDBCtrlGrid
    Left = 8
    Top = 219
    Width = 189
    Height = 342
    AllowDelete = False
    AllowInsert = False
    DataSource = DMLOG.dsEval
    Enabled = False
    PanelHeight = 342
    PanelWidth = 172
    TabOrder = 1
    RowCount = 1
    object lblArt: TLabel
      Left = 7
      Top = 5
      Width = 35
      Height = 13
      Caption = 'Articulo'
    end
    object lblProv: TLabel
      Left = 7
      Top = 26
      Width = 31
      Height = 13
      Caption = 'Prov. :'
      FocusControl = dbeProv
    end
    object dbtCond1: TDBText
      Left = 7
      Top = 55
      Width = 65
      Height = 21
      DataField = 'REFE1'
      DataSource = DMLOG.dsEval
      Visible = False
    end
    object dbtCond3: TDBText
      Left = 7
      Top = 97
      Width = 65
      Height = 17
      DataField = 'REFE3'
      DataSource = DMLOG.dsEval
      Visible = False
    end
    object dbtCond5: TDBText
      Left = 7
      Top = 139
      Width = 65
      Height = 17
      DataField = 'REFE5'
      DataSource = DMLOG.dsEval
      Visible = False
    end
    object dbtCond2: TDBText
      Left = 7
      Top = 76
      Width = 65
      Height = 17
      DataField = 'REFE2'
      DataSource = DMLOG.dsEval
      Visible = False
    end
    object dbtCond4: TDBText
      Left = 7
      Top = 118
      Width = 65
      Height = 17
      DataField = 'REFE4'
      DataSource = DMLOG.dsEval
      Visible = False
    end
    object dbtCond6: TDBText
      Left = 7
      Top = 161
      Width = 65
      Height = 17
      DataField = 'REFE6'
      DataSource = DMLOG.dsEval
      Visible = False
    end
    object dbtCond7: TDBText
      Left = 7
      Top = 182
      Width = 65
      Height = 17
      DataField = 'REFE7'
      DataSource = DMLOG.dsEval
      Visible = False
    end
    object dbtCond8: TDBText
      Left = 7
      Top = 203
      Width = 65
      Height = 17
      DataField = 'REFE8'
      DataSource = DMLOG.dsEval
      Visible = False
    end
    object dbtCond9: TDBText
      Left = 7
      Top = 225
      Width = 65
      Height = 17
      DataField = 'REFE9'
      DataSource = DMLOG.dsEval
      Visible = False
    end
    object lblTotPun: TLabel
      Left = 8
      Top = 270
      Width = 77
      Height = 13
      Caption = 'Total Puntaje'
      FocusControl = dbeTotPun
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbtCond10: TDBText
      Left = 7
      Top = 247
      Width = 65
      Height = 17
      DataField = 'REFE10'
      DataSource = DMLOG.dsEval
      Visible = False
    end
    object dbeArti: TDBEdit
      Left = 49
      Top = 5
      Width = 121
      Height = 21
      DataField = 'ARTID'
      DataSource = DMLOG.dsEval
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object dbeProv: TDBEdit
      Left = 49
      Top = 26
      Width = 121
      Height = 21
      DataField = 'DPROFPRVD'
      DataSource = DMLOG.dsEval
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
    object dbeCond1: TDBEdit
      Left = 89
      Top = 55
      Width = 64
      Height = 21
      AutoSelect = False
      AutoSize = False
      DataSource = DMLOG.dsEval
      Enabled = False
      ReadOnly = True
      TabOrder = 2
      Visible = False
    end
    object dbeCond3: TDBEdit
      Left = 89
      Top = 97
      Width = 64
      Height = 21
      AutoSelect = False
      AutoSize = False
      DataSource = DMLOG.dsEval
      Enabled = False
      ReadOnly = True
      TabOrder = 3
      Visible = False
    end
    object dbeCond5: TDBEdit
      Left = 89
      Top = 139
      Width = 64
      Height = 21
      AutoSelect = False
      AutoSize = False
      DataSource = DMLOG.dsEval
      Enabled = False
      ReadOnly = True
      TabOrder = 4
      Visible = False
    end
    object dbeCond2: TDBEdit
      Left = 89
      Top = 76
      Width = 64
      Height = 21
      AutoSelect = False
      AutoSize = False
      DataSource = DMLOG.dsEval
      Enabled = False
      ReadOnly = True
      TabOrder = 5
      Visible = False
    end
    object dbeCond4: TDBEdit
      Left = 89
      Top = 118
      Width = 64
      Height = 21
      AutoSelect = False
      AutoSize = False
      DataSource = DMLOG.dsEval
      Enabled = False
      ReadOnly = True
      TabOrder = 6
      Visible = False
    end
    object dbeTotPun: TDBEdit
      Left = 89
      Top = 270
      Width = 64
      Height = 21
      AutoSelect = False
      AutoSize = False
      DataField = 'TOT0'
      DataSource = DMLOG.dsEval
      ReadOnly = True
      TabOrder = 7
    end
    object dbeCond10: TDBEdit
      Left = 89
      Top = 247
      Width = 64
      Height = 21
      AutoSelect = False
      AutoSize = False
      DataSource = DMLOG.dsEval
      TabOrder = 8
      Visible = False
      OnExit = dbeCond6Exit
    end
    object dbeCond9: TDBEdit
      Left = 89
      Top = 225
      Width = 64
      Height = 21
      AutoSelect = False
      AutoSize = False
      BiDiMode = bdLeftToRight
      DataSource = DMLOG.dsEval
      ParentBiDiMode = False
      TabOrder = 9
      Visible = False
      OnExit = dbeCond6Exit
    end
    object dbeCond8: TDBEdit
      Left = 89
      Top = 203
      Width = 64
      Height = 21
      AutoSelect = False
      AutoSize = False
      DataSource = DMLOG.dsEval
      TabOrder = 10
      Visible = False
      OnExit = dbeCond6Exit
    end
    object dbeCond7: TDBEdit
      Left = 89
      Top = 182
      Width = 64
      Height = 21
      AutoSelect = False
      AutoSize = False
      DataSource = DMLOG.dsEval
      TabOrder = 11
      Visible = False
      OnExit = dbeCond6Exit
    end
    object dbeCond6: TDBEdit
      Left = 89
      Top = 161
      Width = 64
      Height = 21
      AutoSelect = False
      AutoSize = False
      DataSource = DMLOG.dsEval
      TabOrder = 12
      Visible = False
      OnExit = dbeCond6Exit
    end
  end
  object pnlTP: TPanel
    Left = 195
    Top = 240
    Width = 589
    Height = 209
    BevelInner = bvRaised
    BevelOuter = bvLowered
    BorderStyle = bsSingle
    Color = 10207162
    TabOrder = 2
    Visible = False
    object Bevel2: TBevel
      Left = 13
      Top = 161
      Width = 560
      Height = 2
    end
    object dbgResultado: TwwDBGrid
      Left = 2
      Top = 23
      Width = 581
      Height = 133
      DisableThemesInTitle = False
      Selected.Strings = (
        'PROV'#9'8'#9'PROV'
        'PROFID'#9'15'#9'PROFID'
        'PROVDES'#9'20'#9'PROVDES'
        'TOTAL'#9'10'#9'TOTAL'
        'EVALU'#9'20'#9'EVALU')
      IniAttributes.Delimiter = ';;'
      TitleColor = 10207162
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alTop
      Color = 15792632
      DataSource = DMLOG.dsTotEval
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
    object stxTitulo2: TStaticText
      Left = 2
      Top = 2
      Width = 581
      Height = 21
      Align = alTop
      Alignment = taCenter
      BorderStyle = sbsSunken
      Caption = 'Resultados de Evaluaci'#243'n'
      Color = clHighlight
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clHighlightText
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      TabOrder = 1
    end
    object Z2bbtnOkEval: TBitBtn
      Left = 472
      Top = 167
      Width = 32
      Height = 31
      Hint = 'Edita Motivos de Calificaci'#243'n'
      Default = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = Z2bbtnOkEvalClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
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
    object Z2bbtnCancelEval: TBitBtn
      Left = 543
      Top = 167
      Width = 32
      Height = 31
      Hint = 'Cierra Resultados de Evaluaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = Z2bbtnCancelEvalClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
        0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
        0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
        0333337F777FFFFF7F3333000000000003333377777777777333}
      NumGlyphs = 2
    end
    object Z2bbtnOkPrint1: TBitBtn
      Left = 507
      Top = 167
      Width = 32
      Height = 31
      Hint = 'Imprime Solicitud'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = Z2bbtnOkPrint1Click
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
    object pnlVisar: TPanel
      Left = 19
      Top = -4
      Width = 565
      Height = 209
      BevelInner = bvRaised
      BevelOuter = bvLowered
      BevelWidth = 2
      Color = 10207162
      TabOrder = 5
      Visible = False
      object lblMotivos: TLabel
        Left = 304
        Top = 56
        Width = 55
        Height = 13
        Caption = 'Motivos de '
      end
      object dbrgVisado: TDBRadioGroup
        Left = 13
        Top = 57
        Width = 284
        Height = 40
        Caption = 'Evaluaci'#243'n'
        Columns = 2
        DataField = 'PROFCONCOM'
        DataSource = DMLOG.dsProforma
        Items.Strings = (
          'Evaluado y Aceptado'
          'Evaluado y Descartado')
        TabOrder = 0
        Values.Strings = (
          'A'
          'D')
        OnChange = dbrgVisadoChange
      end
      object stxTitulo1: TStaticText
        Left = 4
        Top = 4
        Width = 557
        Height = 21
        Align = alTop
        Alignment = taCenter
        BorderStyle = sbsSunken
        Caption = 'Motivos de Calificaci'#243'n'
        Color = clHighlight
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clHighlightText
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        ShowAccelChar = False
        TabOrder = 1
      end
      object dblcMotivos: TwwDBLookupCombo
        Left = 304
        Top = 75
        Width = 145
        Height = 21
        DropDownAlignment = taLeftJustify
        LookupTable = DMLOG.cdsMotivos
        LookupField = 'CALIFDES'
        Enabled = False
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnChange = dblcMotivosChange
      end
      object dbreMotivos: TwwDBRichEdit
        Left = 29
        Top = 105
        Width = 536
        Height = 59
        ScrollBars = ssVertical
        AutoURLDetect = False
        DataField = 'PROFOBS'
        Enabled = False
        PrintJobName = 'Delphi 5'
        TabOrder = 3
        EditorCaption = 'Edit Rich Text'
        EditorPosition.Left = 0
        EditorPosition.Top = 0
        EditorPosition.Width = 0
        EditorPosition.Height = 0
        MeasurementUnits = muInches
        PrintMargins.Top = 1.000000000000000000
        PrintMargins.Bottom = 1.000000000000000000
        PrintMargins.Left = 1.000000000000000000
        PrintMargins.Right = 1.000000000000000000
        PrintHeader.VertMargin = 0.500000000000000000
        PrintHeader.Font.Charset = DEFAULT_CHARSET
        PrintHeader.Font.Color = clWindowText
        PrintHeader.Font.Height = -11
        PrintHeader.Font.Name = 'MS Sans Serif'
        PrintHeader.Font.Style = []
        PrintFooter.VertMargin = 0.500000000000000000
        PrintFooter.Font.Charset = DEFAULT_CHARSET
        PrintFooter.Font.Color = clWindowText
        PrintFooter.Font.Height = -11
        PrintFooter.Font.Name = 'MS Sans Serif'
        PrintFooter.Font.Style = []
        RichEditVersion = 2
        Data = {
          800000007B5C727466315C616E73695C616E7369637067313235325C64656666
          305C6465666C616E6731303235307B5C666F6E7474626C7B5C66305C666E696C
          204D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C7563
          315C706172645C66305C6673313620646272654D6F7469766F735C7061720D0A
          7D0D0A00}
      end
      object Z2bbtnOkResul: TBitBtn
        Left = 487
        Top = 171
        Width = 32
        Height = 31
        Hint = 'Acepta Motivos de Calificaci'#243'n'
        Default = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = Z2bbtnOkResulClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
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
      object Z2bbtnCancelResul: TBitBtn
        Left = 519
        Top = 171
        Width = 32
        Height = 31
        Hint = 'Cierra Motivos de Calificaci'#243'n'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = Z2bbtnCancelResulClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333000033911833333333333333333F333333333333
          0000339111833333911333333388F333333F3333000033911118333911118333
          38F38F333F88F33300003339111183911111833338F338F3F8338F3300003333
          911118111118333338F3338F833338F3000033333911111111833333338F3338
          3333F8330000333333911111183333333338F333333F83330000333333311111
          8333333333338F3333383333000033333339111183333333333338F333833333
          00003333339111118333333333333833338F3333000033333911181118333333
          33338333338F333300003333911183911183333333383338F338F33300003339
          1118333911183333338F33838F338F33000033911183333391118333338FF833
          38F338F300003391183333333911133333388333338FFF830000333913333333
          3391833333333333333888330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
      object edtDatosProf: TEdit
        Left = 13
        Top = 32
        Width = 539
        Height = 21
        Enabled = False
        TabOrder = 6
      end
    end
  end
  object ppDBPReport1: TppDBPipeline
    DataSource = DMLOG.dsEval
    UserName = 'DBPReport1'
    Left = 402
    Top = 50
  end
  object ppReport1: TppReport
    AutoStop = False
    Columns = 3
    DataPipeline = ppDBPReport1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 211000
    PrinterSetup.PaperSize = 9
    Units = utMillimeters
    AfterPrint = dbeCond6Exit
    BeforePrint = ppReport1BeforePrint
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppReport1PreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 338
    Top = 32
    Version = '7.02'
    mmColumnWidth = 67733
    DataPipelineName = 'ppDBPReport1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 18521
      mmPrintPosition = 0
      object ppDBTCia: TppDBText
        UserName = 'DBTCia'
        AutoSize = True
        DataField = 'CIADES'
        DataPipeline = ppDBPReport1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draf 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPReport1'
        mmHeight = 4233
        mmLeft = 0
        mmTop = 265
        mmWidth = 12700
        BandType = 0
      end
      object ppDBTCiadir: TppDBText
        UserName = 'DBTCiadir'
        AutoSize = True
        DataField = 'CIADIRE'
        DataPipeline = ppDBPReport1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draf 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPReport1'
        mmHeight = 4233
        mmLeft = 0
        mmTop = 4763
        mmWidth = 14552
        BandType = 0
      end
      object ppLblciatlf: TppLabel
        UserName = 'Lblciatlf'
        Caption = 'Telf. '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draf 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 8996
        mmWidth = 7408
        BandType = 0
      end
      object ppDBTCiatlf: TppDBText
        UserName = 'DBTCiatlf'
        AutoSize = True
        DataField = 'CIATLF'
        DataPipeline = ppDBPReport1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draf 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPReport1'
        mmHeight = 4233
        mmLeft = 7673
        mmTop = 8996
        mmWidth = 12435
        BandType = 0
      end
      object ppLblciafax: TppLabel
        UserName = 'Lblciafax'
        Caption = ' - Fax '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draf 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 21960
        mmTop = 8996
        mmWidth = 10054
        BandType = 0
      end
      object ppDBTciafax: TppDBText
        UserName = 'DBTciafax'
        AutoSize = True
        DataField = 'CIAFAX'
        DataPipeline = ppDBPReport1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draf 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPReport1'
        mmHeight = 4233
        mmLeft = 32279
        mmTop = 8996
        mmWidth = 12965
        BandType = 0
      end
      object ppLblTit: TppLabel
        UserName = 'LblTit'
        Caption = 'EVALUACION DE PROFORMAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draf 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 70908
        mmTop = 4763
        mmWidth = 51065
        BandType = 0
      end
      object ppLblSCCID: TppLabel
        UserName = 'LblSCCID'
        Caption = 'Solicitud de Cotizaci'#243'n N'#176': '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 16744448
        Font.Name = 'Draf 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 132821
        mmTop = 11906
        mmWidth = 45773
        BandType = 0
      end
      object ppDBTSccid: TppDBText
        UserName = 'DBTSccid'
        DataField = 'SCCID'
        DataPipeline = ppDBPReport1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draf 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBPReport1'
        mmHeight = 4233
        mmLeft = 178859
        mmTop = 11905
        mmWidth = 17198
        BandType = 0
      end
      object ppLn1: TppLine
        UserName = 'Ln1'
        Pen.Width = 3
        Weight = 2.250000000000000000
        mmHeight = 1270
        mmLeft = 0
        mmTop = 17198
        mmWidth = 202407
        BandType = 0
      end
    end
    object ppColumnHeaderBand1: TppColumnHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 66940
      mmPrintPosition = 0
      object ppLblProv: TppLabel
        UserName = 'LblProv'
        Caption = 'Proveedor : '
        Font.Charset = ANSI_CHARSET
        Font.Color = 16744448
        Font.Name = 'MS Serif'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1588
        mmTop = 2117
        mmWidth = 21696
        BandType = 4
      end
      object ppDBTProv: TppDBText
        UserName = 'DBTProv'
        DataField = 'DPROFPRVD'
        DataPipeline = ppDBPReport1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Serif'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPReport1'
        mmHeight = 4233
        mmLeft = 1588
        mmTop = 6879
        mmWidth = 56092
        BandType = 4
      end
      object ppDBTRef1: TppDBText
        UserName = 'DBTRef1'
        DataField = 'REFE1'
        DataPipeline = ppDBPReport1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Serif'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPReport1'
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 12435
        mmWidth = 46302
        BandType = 4
      end
      object ppDBTDat1: TppDBText
        UserName = 'DBTDat1'
        DataField = 'DPROFTEN'
        DataPipeline = ppDBPReport1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Serif'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPReport1'
        mmHeight = 4233
        mmLeft = 50006
        mmTop = 12435
        mmWidth = 7408
        BandType = 4
      end
      object ppDBTRef2: TppDBText
        UserName = 'DBTRef2'
        DataField = 'REFE2'
        DataPipeline = ppDBPReport1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Serif'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPReport1'
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 17198
        mmWidth = 46302
        BandType = 4
      end
      object ppDBTDat2: TppDBText
        UserName = 'DBTDat2'
        DataField = 'DPROFGARAN'
        DataPipeline = ppDBPReport1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Serif'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPReport1'
        mmHeight = 4233
        mmLeft = 50006
        mmTop = 17198
        mmWidth = 7408
        BandType = 4
      end
      object ppDBTDat3: TppDBText
        UserName = 'DBTDat3'
        DataField = 'DPROFVALID'
        DataPipeline = ppDBPReport1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Serif'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPReport1'
        mmHeight = 4233
        mmLeft = 50006
        mmTop = 21960
        mmWidth = 7408
        BandType = 4
      end
      object ppDBTRef3: TppDBText
        UserName = 'DBTRef3'
        DataField = 'REFE3'
        DataPipeline = ppDBPReport1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Serif'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPReport1'
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 21960
        mmWidth = 46302
        BandType = 4
      end
      object ppDBTRef4: TppDBText
        UserName = 'DBTRef4'
        DataField = 'REFE4'
        DataPipeline = ppDBPReport1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Serif'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPReport1'
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 26723
        mmWidth = 46302
        BandType = 4
      end
      object ppDBTDat4: TppDBText
        UserName = 'DBTDat4'
        DataField = 'PRECIO'
        DataPipeline = ppDBPReport1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Serif'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPReport1'
        mmHeight = 4233
        mmLeft = 50006
        mmTop = 26723
        mmWidth = 7408
        BandType = 4
      end
      object ppDBTDat5: TppDBText
        UserName = 'DBTDat5'
        DataField = 'PTOS5'
        DataPipeline = ppDBPReport1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Serif'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPReport1'
        mmHeight = 4233
        mmLeft = 50006
        mmTop = 31485
        mmWidth = 7408
        BandType = 4
      end
      object ppDBTRef5: TppDBText
        UserName = 'DBTRef5'
        DataField = 'REFE5'
        DataPipeline = ppDBPReport1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Serif'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPReport1'
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 31485
        mmWidth = 46302
        BandType = 4
      end
      object ppDBTRef6: TppDBText
        UserName = 'DBTRef6'
        DataField = 'REFE6'
        DataPipeline = ppDBPReport1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Serif'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPReport1'
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 36248
        mmWidth = 46302
        BandType = 4
      end
      object ppDBTDat6: TppDBText
        UserName = 'DBTDat6'
        DataField = 'PTOS6'
        DataPipeline = ppDBPReport1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Serif'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPReport1'
        mmHeight = 4233
        mmLeft = 50006
        mmTop = 36248
        mmWidth = 7408
        BandType = 4
      end
      object ppDBTRef7: TppDBText
        UserName = 'DBTRef7'
        DataField = 'REFE7'
        DataPipeline = ppDBPReport1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Serif'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPReport1'
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 41010
        mmWidth = 46302
        BandType = 4
      end
      object ppDBTDat7: TppDBText
        UserName = 'DBText101'
        DataField = 'PTOS7'
        DataPipeline = ppDBPReport1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Serif'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPReport1'
        mmHeight = 4233
        mmLeft = 50006
        mmTop = 41010
        mmWidth = 7408
        BandType = 4
      end
      object ppDBTRef8: TppDBText
        UserName = 'DBTRef8'
        DataField = 'REFE8'
        DataPipeline = ppDBPReport1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Serif'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPReport1'
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 45773
        mmWidth = 46302
        BandType = 4
      end
      object ppDBTDat8: TppDBText
        UserName = 'DBTDat8'
        DataField = 'PTOS8'
        DataPipeline = ppDBPReport1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Serif'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPReport1'
        mmHeight = 4233
        mmLeft = 50006
        mmTop = 45773
        mmWidth = 7408
        BandType = 4
      end
      object ppDBTRef9: TppDBText
        UserName = 'DBTRef9'
        DataField = 'REFE9'
        DataPipeline = ppDBPReport1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Serif'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPReport1'
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 50536
        mmWidth = 46302
        BandType = 4
      end
      object ppDBTDat9: TppDBText
        UserName = 'DBTDat9'
        DataField = 'PTOS9'
        DataPipeline = ppDBPReport1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Serif'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPReport1'
        mmHeight = 4233
        mmLeft = 50006
        mmTop = 50536
        mmWidth = 7408
        BandType = 4
      end
      object ppDBTRef10: TppDBText
        UserName = 'DBTRef10'
        DataField = 'REFE10'
        DataPipeline = ppDBPReport1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Serif'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPReport1'
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 55298
        mmWidth = 46302
        BandType = 4
      end
      object ppDBTDat10: TppDBText
        UserName = 'DBTDat10'
        DataField = 'PTOS10'
        DataPipeline = ppDBPReport1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Serif'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPReport1'
        mmHeight = 4233
        mmLeft = 50006
        mmTop = 55298
        mmWidth = 7408
        BandType = 4
      end
      object ppDBTPto: TppDBText
        UserName = 'DBTPto'
        DataField = 'TOT1'
        DataPipeline = ppDBPReport1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Serif'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPReport1'
        mmHeight = 4233
        mmLeft = 42863
        mmTop = 62442
        mmWidth = 14288
        BandType = 4
      end
      object ppLblPTO: TppLabel
        UserName = 'LblPTO'
        Caption = 'Total Puntaje : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Serif'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 15081
        mmTop = 62706
        mmWidth = 25929
        BandType = 4
      end
    end
    object ppColumnFooterBand1: TppColumnFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'ARTID'
      DataPipeline = ppDBPReport1
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBPReport1'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 8731
        mmPrintPosition = 0
        object ppLblArt: TppLabel
          UserName = 'LblArt'
          Caption = 'Articulo : '
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Name = 'MS Serif'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1058
          mmTop = 529
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object ppDBTArt: TppDBText
          UserName = 'DBTArt'
          DataField = 'DPROFARTD'
          DataPipeline = ppDBPReport1
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'MS Serif'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDBPReport1'
          mmHeight = 4233
          mmLeft = 794
          mmTop = 4498
          mmWidth = 56356
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object ppDBPReport2: TppDBPipeline
    DataSource = DMLOG.dsTotEval
    UserName = 'DBPReport2'
    Left = 418
    Top = 122
    MasterDataPipelineName = 'ppDBPReport1'
    object ppField1: TppField
      FieldAlias = 'PROV'
      FieldName = 'PROV'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppField2: TppField
      FieldAlias = 'PROFID'
      FieldName = 'PROFID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 1
    end
    object ppField3: TppField
      FieldAlias = 'PROVDES'
      FieldName = 'PROVDES'
      FieldLength = 40
      DisplayWidth = 20
      Position = 2
    end
    object ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTAL'
      FieldName = 'TOTAL'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 3
    end
    object ppField5: TppField
      FieldAlias = 'EVALU0'
      FieldName = 'EVALU0'
      FieldLength = 21
      DisplayWidth = 21
      Position = 4
    end
    object ppField6: TppField
      FieldAlias = 'EVALU1'
      FieldName = 'EVALU1'
      FieldLength = 19
      DisplayWidth = 19
      Position = 5
    end
    object ppField7: TppField
      FieldAlias = 'EVALU2'
      FieldName = 'EVALU2'
      FieldLength = 21
      DisplayWidth = 21
      Position = 6
    end
    object ppField8: TppField
      FieldAlias = 'EVALU'
      FieldName = 'EVALU'
      FieldLength = 128
      DisplayWidth = 20
      Position = 7
    end
  end
  object ppReport2: TppReport
    AutoStop = False
    DataPipeline = ppDBPReport2
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'RESUMEN'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 296863
    PrinterSetup.mmPaperWidth = 210874
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\SOLCompras\SolFormatos\EvalProAcep.rtm'
    BeforePrint = ppReport2BeforePrint
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppReport2PreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 474
    Top = 122
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPReport2'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25135
      mmPrintPosition = 0
      object ppLblTotEval: TppLabel
        UserName = 'LblTotEval'
        Caption = 'Total de la Evaluaci'#243'n de Proformas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 64558
        mmTop = 1852
        mmWidth = 61119
        BandType = 0
      end
      object ppDBTTESccid: TppDBText
        UserName = 'DBTSccid1'
        AutoSize = True
        DataField = 'SCCID'
        DataPipeline = ppDBPReport2
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPReport2'
        mmHeight = 4233
        mmLeft = 168540
        mmTop = 11906
        mmWidth = 10583
        BandType = 0
      end
      object ppDBTTECia: TppDBText
        UserName = 'DBTCia1'
        AutoSize = True
        DataField = 'CIADES'
        DataPipeline = ppDBPReport1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPReport1'
        mmHeight = 4233
        mmLeft = 0
        mmTop = 265
        mmWidth = 12700
        BandType = 0
      end
      object ppDBTTECiaDes: TppDBText
        UserName = 'DBTCiadir1'
        AutoSize = True
        DataField = 'CIADIRE'
        DataPipeline = ppDBPReport1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPReport1'
        mmHeight = 4233
        mmLeft = 0
        mmTop = 4763
        mmWidth = 13494
        BandType = 0
      end
      object ppLblTECiaTlf: TppLabel
        UserName = 'Lblciatlf1'
        Caption = 'Telf. '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 8996
        mmWidth = 7408
        BandType = 0
      end
      object ppDBTTECiaTlf: TppDBText
        UserName = 'DBTCiatlf1'
        AutoSize = True
        DataField = 'CIATLF'
        DataPipeline = ppDBPReport1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPReport1'
        mmHeight = 4233
        mmLeft = 7673
        mmTop = 8996
        mmWidth = 11377
        BandType = 0
      end
      object ppLblTECiaFax: TppLabel
        UserName = 'Lblciafax1'
        Caption = ' - Fax '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 21960
        mmTop = 8996
        mmWidth = 10054
        BandType = 0
      end
      object ppDBTTECiaFax: TppDBText
        UserName = 'DBTciafax1'
        AutoSize = True
        DataField = 'CIAFAX'
        DataPipeline = ppDBPReport1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPReport1'
        mmHeight = 4233
        mmLeft = 32279
        mmTop = 8996
        mmWidth = 11906
        BandType = 0
      end
      object ppLblTESCCId: TppLabel
        UserName = 'LblSCCID1'
        Caption = 'Solicitud de Cotizaci'#243'n N'#176': '
        Font.Charset = ANSI_CHARSET
        Font.Color = 16744448
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 121973
        mmTop = 11906
        mmWidth = 45773
        BandType = 0
      end
      object ppLnTE1: TppLine
        UserName = 'LnTE1'
        Pen.Width = 3
        Weight = 2.250000000000000000
        mmHeight = 1270
        mmLeft = 0
        mmTop = 24077
        mmWidth = 202407
        BandType = 0
      end
      object ppLblTEProf: TppLabel
        UserName = 'Label2'
        Caption = 'Proforma'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 5292
        mmTop = 19579
        mmWidth = 15610
        BandType = 0
      end
      object ppLblTEProv: TppLabel
        UserName = 'Label3'
        Caption = 'Proveedor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 24606
        mmTop = 19579
        mmWidth = 17463
        BandType = 0
      end
      object ppLblTETotal: TppLabel
        UserName = 'Label4'
        Caption = 'Total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 126736
        mmTop = 19579
        mmWidth = 8467
        BandType = 0
      end
      object ppLblTEObs: TppLabel
        UserName = 'LblTEObs'
        Caption = 'Estado de la Evaluaci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 141288
        mmTop = 19579
        mmWidth = 40217
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBTTEProf: TppDBText
        UserName = 'DBTTEProf'
        DataField = 'PROFID'
        DataPipeline = ppDBPReport2
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPReport2'
        mmHeight = 4233
        mmLeft = 5292
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBTTEProv: TppDBText
        UserName = 'DBTTEProv'
        DataField = 'PROVDES'
        DataPipeline = ppDBPReport2
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPReport2'
        mmHeight = 4233
        mmLeft = 24606
        mmTop = 794
        mmWidth = 96573
        BandType = 4
      end
      object ppDBTTETot: TppDBText
        UserName = 'DBTTETot'
        DataField = 'TOTAL'
        DataPipeline = ppDBPReport2
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPReport2'
        mmHeight = 4233
        mmLeft = 122502
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBTTEEval: TppDBText
        UserName = 'DBTTEEval'
        DataField = 'EVALU'
        DataPipeline = ppDBPReport2
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPReport2'
        mmHeight = 4233
        mmLeft = 141288
        mmTop = 794
        mmWidth = 55563
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
  end
  object ppReport3: TppReport
    AutoStop = False
    DataPipeline = ppDBPReport1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'EVALUACION'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\Sol\SOLCompras\SOLFormatos\EvalProTot.rtm'
    Units = utMillimeters
    BeforePrint = ppReport3BeforePrint
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppReport3PreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 562
    Top = 146
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPReport1'
    object ppHeaderBand3: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 18521
      mmPrintPosition = 0
      object ppDBTCiaR3: TppDBText
        UserName = 'DBTCia2'
        AutoSize = True
        DataField = 'CIADES'
        DataPipeline = ppDBPReport1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPReport1'
        mmHeight = 4233
        mmLeft = 529
        mmTop = 265
        mmWidth = 12700
        BandType = 0
      end
      object ppLblTitR3: TppLabel
        UserName = 'LblTit1'
        Caption = 'EVALUACION DE PROFORMAS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 96309
        mmTop = 4763
        mmWidth = 51065
        BandType = 0
      end
      object ppLblSccidR3: TppLabel
        UserName = 'LblSCCID2'
        Caption = 'Solicitud de Cotizaci'#243'n N'#176': '
        Font.Charset = ANSI_CHARSET
        Font.Color = 16744448
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 215636
        mmTop = 12171
        mmWidth = 45773
        BandType = 0
      end
      object ppDBTSccidR3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'SCCID'
        DataPipeline = ppDBPReport2
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPReport2'
        mmHeight = 4233
        mmLeft = 261938
        mmTop = 12171
        mmWidth = 10583
        BandType = 0
      end
      object ppLn1R3: TppLine
        UserName = 'Ln1R3'
        Pen.Width = 3
        Weight = 2.250000000000000000
        mmHeight = 1323
        mmLeft = 0
        mmTop = 16140
        mmWidth = 283369
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageSet
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 266701
        mmTop = 4763
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Compras'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 5027
        mmWidth = 13758
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 12171
      mmPrintPosition = 0
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppDBPReport1'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppDBPReport1
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'EVALUACION'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 210000
          PrinterSetup.mmPaperWidth = 297000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Left = 392
          Top = 280
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppDBPReport1'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 13229
            mmPrintPosition = 0
            object ppLabel1: TppLabel
              UserName = 'Label2'
              Caption = 'Articulo : '
              Font.Charset = ANSI_CHARSET
              Font.Color = clRed
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 3440
              mmTop = 9790
              mmWidth = 13758
              BandType = 1
            end
            object ppDBText1: TppDBText
              UserName = 'DBText1'
              CharWrap = True
              DataField = 'REFE1'
              DataPipeline = ppDBPReport1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              WordWrap = True
              DataPipelineName = 'ppDBPReport1'
              mmHeight = 7938
              mmLeft = 70115
              mmTop = 5292
              mmWidth = 18785
              BandType = 1
            end
            object ppDBText2: TppDBText
              UserName = 'DBText2'
              CharWrap = True
              DataField = 'REFE2'
              DataPipeline = ppDBPReport1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              WordWrap = True
              DataPipelineName = 'ppDBPReport1'
              mmHeight = 7938
              mmLeft = 89694
              mmTop = 5292
              mmWidth = 18785
              BandType = 1
            end
            object ppDBText3: TppDBText
              UserName = 'DBText3'
              CharWrap = True
              DataField = 'REFE3'
              DataPipeline = ppDBPReport1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              WordWrap = True
              DataPipelineName = 'ppDBPReport1'
              mmHeight = 7938
              mmLeft = 109009
              mmTop = 5292
              mmWidth = 18785
              BandType = 1
            end
            object ppDBText4: TppDBText
              UserName = 'DBText4'
              CharWrap = True
              DataField = 'REFE4'
              DataPipeline = ppDBPReport1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              WordWrap = True
              DataPipelineName = 'ppDBPReport1'
              mmHeight = 7938
              mmLeft = 128588
              mmTop = 5292
              mmWidth = 18785
              BandType = 1
            end
            object ppDBText5: TppDBText
              UserName = 'DBText5'
              CharWrap = True
              DataField = 'REFE5'
              DataPipeline = ppDBPReport1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              WordWrap = True
              DataPipelineName = 'ppDBPReport1'
              mmHeight = 7938
              mmLeft = 147902
              mmTop = 5292
              mmWidth = 18785
              BandType = 1
            end
            object ppDBText6: TppDBText
              UserName = 'DBText6'
              CharWrap = True
              DataField = 'REFE6'
              DataPipeline = ppDBPReport1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              WordWrap = True
              DataPipelineName = 'ppDBPReport1'
              mmHeight = 7938
              mmLeft = 167482
              mmTop = 5292
              mmWidth = 18785
              BandType = 1
            end
            object ppDBText7: TppDBText
              UserName = 'DBText7'
              CharWrap = True
              DataField = 'REFE7'
              DataPipeline = ppDBPReport1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              WordWrap = True
              DataPipelineName = 'ppDBPReport1'
              mmHeight = 7938
              mmLeft = 187061
              mmTop = 5292
              mmWidth = 18785
              BandType = 1
            end
            object ppDBText8: TppDBText
              UserName = 'DBText8'
              CharWrap = True
              DataField = 'REFE8'
              DataPipeline = ppDBPReport1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              WordWrap = True
              DataPipelineName = 'ppDBPReport1'
              mmHeight = 7938
              mmLeft = 206375
              mmTop = 5292
              mmWidth = 18785
              BandType = 1
            end
            object ppDBText9: TppDBText
              UserName = 'DBText9'
              CharWrap = True
              DataField = 'REFE9'
              DataPipeline = ppDBPReport1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              WordWrap = True
              DataPipelineName = 'ppDBPReport1'
              mmHeight = 7938
              mmLeft = 225690
              mmTop = 5292
              mmWidth = 18785
              BandType = 1
            end
            object ppDBText10: TppDBText
              UserName = 'DBText10'
              CharWrap = True
              DataField = 'REFE10'
              DataPipeline = ppDBPReport1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              WordWrap = True
              DataPipelineName = 'ppDBPReport1'
              mmHeight = 7938
              mmLeft = 245005
              mmTop = 5292
              mmWidth = 18785
              BandType = 1
            end
            object ppLabel2: TppLabel
              UserName = 'Label3'
              Caption = 'Total Puntaje'
              Font.Charset = ANSI_CHARSET
              Font.Color = clRed
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 265113
              mmTop = 9790
              mmWidth = 18785
              BandType = 1
            end
          end
          object ppDetailBand4: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object ppDBText12: TppDBText
              UserName = 'DBText12'
              DataField = 'DPROFPRVD'
              DataPipeline = ppDBPReport1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPReport1'
              mmHeight = 3704
              mmLeft = 1323
              mmTop = 0
              mmWidth = 61383
              BandType = 4
            end
            object ppDBText13: TppDBText
              UserName = 'DBText13'
              DataField = 'TOT1'
              DataPipeline = ppDBPReport1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDBPReport1'
              mmHeight = 3704
              mmLeft = 67998
              mmTop = 0
              mmWidth = 18785
              BandType = 4
            end
            object ppDBText14: TppDBText
              UserName = 'DBText14'
              DataField = 'TOT2'
              DataPipeline = ppDBPReport1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDBPReport1'
              mmHeight = 3704
              mmLeft = 87577
              mmTop = 0
              mmWidth = 18785
              BandType = 4
            end
            object ppDBText15: TppDBText
              UserName = 'DBText15'
              DataField = 'TOT3'
              DataPipeline = ppDBPReport1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDBPReport1'
              mmHeight = 3704
              mmLeft = 106892
              mmTop = 0
              mmWidth = 18785
              BandType = 4
            end
            object ppDBText16: TppDBText
              UserName = 'DBText16'
              DataField = 'TOT4'
              DataPipeline = ppDBPReport1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDBPReport1'
              mmHeight = 3704
              mmLeft = 126471
              mmTop = 0
              mmWidth = 18785
              BandType = 4
            end
            object ppDBText17: TppDBText
              UserName = 'DBText17'
              DataField = 'TOT5'
              DataPipeline = ppDBPReport1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDBPReport1'
              mmHeight = 3704
              mmLeft = 145786
              mmTop = 0
              mmWidth = 18785
              BandType = 4
            end
            object ppDBText18: TppDBText
              UserName = 'DBText18'
              DataField = 'TOT6'
              DataPipeline = ppDBPReport1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDBPReport1'
              mmHeight = 3704
              mmLeft = 165365
              mmTop = 0
              mmWidth = 18785
              BandType = 4
            end
            object ppDBText19: TppDBText
              UserName = 'DBText19'
              DataField = 'PTOS7'
              DataPipeline = ppDBPReport1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDBPReport1'
              mmHeight = 3704
              mmLeft = 184944
              mmTop = 0
              mmWidth = 18785
              BandType = 4
            end
            object ppDBText20: TppDBText
              UserName = 'DBText20'
              DataField = 'TOT8'
              DataPipeline = ppDBPReport1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDBPReport1'
              mmHeight = 3704
              mmLeft = 204259
              mmTop = 0
              mmWidth = 18785
              BandType = 4
            end
            object ppDBText21: TppDBText
              UserName = 'DBText21'
              DataField = 'TOT9'
              DataPipeline = ppDBPReport1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDBPReport1'
              mmHeight = 3704
              mmLeft = 223573
              mmTop = 0
              mmWidth = 18785
              BandType = 4
            end
            object ppDBText22: TppDBText
              UserName = 'DBText22'
              DataField = 'TOT10'
              DataPipeline = ppDBPReport1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDBPReport1'
              mmHeight = 3704
              mmLeft = 242888
              mmTop = 0
              mmWidth = 18785
              BandType = 4
            end
            object ppDBText23: TppDBText
              UserName = 'DBText23'
              DataField = 'TOT0'
              DataPipeline = ppDBPReport1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDBPReport1'
              mmHeight = 3704
              mmLeft = 262996
              mmTop = 0
              mmWidth = 17992
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 1852
            mmPrintPosition = 0
            object ppLine2: TppLine
              UserName = 'Line2'
              Pen.Width = 3
              Weight = 2.250000000000000000
              mmHeight = 1323
              mmLeft = 265
              mmTop = 529
              mmWidth = 283369
              BandType = 7
            end
          end
          object ppGroup2: TppGroup
            BreakName = 'ARTID'
            DataPipeline = ppDBPReport1
            KeepTogether = True
            OutlineSettings.CreateNode = True
            UserName = 'Group2'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppDBPReport1'
            object ppGroupHeaderBand2: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 11113
              mmPrintPosition = 0
              object ppLine1: TppLine
                UserName = 'Line1'
                Pen.Width = 3
                Weight = 2.250000000000000000
                mmHeight = 794
                mmLeft = 529
                mmTop = 794
                mmWidth = 64029
                BandType = 3
                GroupNo = 0
              end
              object ppDBText11: TppDBText
                UserName = 'DBText11'
                DataField = 'DPROFARTD'
                DataPipeline = ppDBPReport1
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDBPReport1'
                mmHeight = 3704
                mmLeft = 794
                mmTop = 2646
                mmWidth = 52388
                BandType = 3
                GroupNo = 0
              end
              object ppLabel3: TppLabel
                UserName = 'Label1'
                Caption = 'Proveedor : '
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 794
                mmTop = 7673
                mmWidth = 15610
                BandType = 3
                GroupNo = 0
              end
            end
            object ppGroupFooterBand2: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
        end
      end
      object ppSubReport2: TppSubReport
        UserName = 'SubReport2'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppSubReport1
        TraverseAllData = False
        DataPipelineName = 'ppDBPReport2'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 7144
        mmWidth = 284300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = ppDBPReport2
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'EVALUACION'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 210000
          PrinterSetup.mmPaperWidth = 297000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Left = 408
          Top = 296
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppDBPReport2'
          object ppTitleBand2: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 15081
            mmPrintPosition = 0
            object ppLblTit2: TppLabel
              UserName = 'LblTotEval1'
              Caption = 'Total de la Evaluaci'#243'n de Proformas'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 64558
              mmTop = 1852
              mmWidth = 61119
              BandType = 1
            end
            object ppLabel5: TppLabel
              UserName = 'Label5'
              Caption = 'Proforma'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 44186
              mmTop = 8996
              mmWidth = 15610
              BandType = 1
            end
            object ppLabel6: TppLabel
              UserName = 'Label6'
              Caption = 'Proveedor'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 63500
              mmTop = 8996
              mmWidth = 17463
              BandType = 1
            end
            object ppLabel7: TppLabel
              UserName = 'Label7'
              Caption = 'Total'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 165629
              mmTop = 8996
              mmWidth = 8467
              BandType = 1
            end
            object ppLabel8: TppLabel
              UserName = 'LblTEObs1'
              Caption = 'Estado de la Evaluaci'#243'n'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 180182
              mmTop = 8996
              mmWidth = 40217
              BandType = 1
            end
            object ppLn2: TppLine
              UserName = 'Ln2'
              Pen.Width = 3
              Weight = 2.250000000000000000
              mmHeight = 1323
              mmLeft = 37835
              mmTop = 13758
              mmWidth = 202407
              BandType = 1
            end
          end
          object ppDetailBand5: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5027
            mmPrintPosition = 0
            object ppDBText24: TppDBText
              UserName = 'DBTTEProf1'
              DataField = 'PROFID'
              DataPipeline = ppDBPReport2
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppDBPReport2'
              mmHeight = 4233
              mmLeft = 44186
              mmTop = 794
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText25: TppDBText
              UserName = 'DBTTEProv1'
              DataField = 'PROVDES'
              DataPipeline = ppDBPReport2
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppDBPReport2'
              mmHeight = 4233
              mmLeft = 63500
              mmTop = 794
              mmWidth = 96573
              BandType = 4
            end
            object ppDBText26: TppDBText
              UserName = 'DBTTETot1'
              DataField = 'TOTAL'
              DataPipeline = ppDBPReport2
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDBPReport2'
              mmHeight = 4233
              mmLeft = 161396
              mmTop = 794
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText27: TppDBText
              UserName = 'DBTTEEval1'
              DataField = 'EVALU'
              DataPipeline = ppDBPReport2
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPReport2'
              mmHeight = 4233
              mmLeft = 180182
              mmTop = 794
              mmWidth = 55563
              BandType = 4
            end
          end
        end
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
  end
end
