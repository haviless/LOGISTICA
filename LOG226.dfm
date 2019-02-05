object FNegociacion: TFNegociacion
  Left = 11
  Top = 17
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Negociaci'#243'n de Precios'
  ClientHeight = 528
  ClientWidth = 690
  Color = 12904163
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 15
  object Panel1: TPanel
    Left = 4
    Top = 8
    Width = 683
    Height = 513
    Color = 10207162
    TabOrder = 0
    object Label4: TLabel
      Left = 21
      Top = 208
      Width = 155
      Height = 15
      Caption = 'Precio de Comp. con IGV (Ori)'
    end
    object Label5: TLabel
      Left = 21
      Top = 230
      Width = 152
      Height = 15
      Caption = 'Precio de Comp. sin IGV (Ori)'
    end
    object Label8: TLabel
      Left = 21
      Top = 250
      Width = 140
      Height = 15
      Caption = 'Precio de Costo en Und. Vta'
    end
    object Label9: TLabel
      Left = 21
      Top = 271
      Width = 107
      Height = 15
      Caption = 'Descuento Compras 1'
    end
    object Label10: TLabel
      Left = 21
      Top = 292
      Width = 109
      Height = 15
      Caption = 'Descuento Compras 2'
    end
    object Label11: TLabel
      Left = 21
      Top = 313
      Width = 109
      Height = 15
      Caption = 'Descuento Compras 3'
    end
    object Label12: TLabel
      Left = 21
      Top = 333
      Width = 109
      Height = 15
      Caption = 'Descuento Compras 4'
    end
    object Label13: TLabel
      Left = 21
      Top = 354
      Width = 109
      Height = 15
      Caption = 'Descuento Compras 5'
    end
    object Label14: TLabel
      Left = 21
      Top = 375
      Width = 115
      Height = 15
      Caption = 'Precio de Costo (Neto)'
    end
    object Label15: TLabel
      Left = 21
      Top = 416
      Width = 39
      Height = 15
      Caption = 'Margen'
    end
    object Label16: TLabel
      Left = 21
      Top = 437
      Width = 98
      Height = 15
      Caption = 'Descuento Ventas 1'
    end
    object Label17: TLabel
      Left = 21
      Top = 458
      Width = 100
      Height = 15
      Caption = 'Descuento Ventas 2'
    end
    object Label18: TLabel
      Left = 21
      Top = 479
      Width = 92
      Height = 13
      Caption = 'Precio de Venta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label19: TLabel
      Left = 276
      Top = 140
      Width = 78
      Height = 15
      Caption = 'Tipo de Cambio'
    end
    object lblArti: TLabel
      Left = 17
      Top = 95
      Width = 42
      Height = 15
      Caption = 'Art'#237'culo'
      Transparent = True
    end
    object lblGrArtID: TLabel
      Left = 18
      Top = 55
      Width = 91
      Height = 15
      Caption = 'Linea de Producto'
    end
    object lblProv: TLabel
      Left = 221
      Top = 9
      Width = 52
      Height = 15
      Caption = 'Proveedor'
    end
    object Label2: TLabel
      Left = 432
      Top = 96
      Width = 45
      Height = 15
      Caption = 'Cantidad'
    end
    object Label3: TLabel
      Left = 556
      Top = 96
      Width = 43
      Height = 15
      Caption = 'Registro'
    end
    object lblSUBFAM: TLabel
      Left = 503
      Top = 52
      Width = 60
      Height = 15
      Caption = 'Sub Familia'
    end
    object Label1: TLabel
      Left = 498
      Top = 10
      Width = 31
      Height = 15
      Caption = 'Grupo'
    end
    object lblFAM: TLabel
      Left = 337
      Top = 52
      Width = 37
      Height = 15
      Caption = 'Familia'
    end
    object lblCia: TLabel
      Left = 18
      Top = 12
      Width = 49
      Height = 15
      Caption = 'Compa'#241#237'a'
    end
    object lblTMon: TLabel
      Left = 20
      Top = 140
      Width = 66
      Height = 15
      Caption = 'Tipo Moneda'
    end
    object Label6: TLabel
      Left = 168
      Top = 140
      Width = 44
      Height = 15
      Caption = 'Relaci'#243'n'
    end
    object Label7: TLabel
      Left = 21
      Top = 396
      Width = 98
      Height = 15
      Caption = 'Descuento / Precio'
    end
    object Z2bbtnOK: TBitBtn
      Left = 570
      Top = 462
      Width = 32
      Height = 31
      Hint = 'Pasa a Registrar Detalle'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = Z2bbtnOKClick
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
    object Z2bbtnCancel: TBitBtn
      Left = 605
      Top = 462
      Width = 32
      Height = 31
      Hint = 'Reinicia Comprobante'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = Z2bbtnCancelClick
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
    object dblcCIA: TwwDBLookupCombo
      Left = 17
      Top = 28
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'ID'#9'F'
        'CIADES'#9'40'#9'Descripci'#243'n'#9'F'
        'CIAABR'#9'15'#9'Abreviatura'#9'F')
      DataField = 'CIAID'
      DataSource = DMLOG.dsNegociacion
      LookupTable = DMLOG.cdsCIA
      LookupField = 'CIAID'
      Options = [loColLines, loTitles]
      DropDownCount = 15
      Enabled = False
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcCIAExit
      OnNotInList = NotExists
    end
    object edtCIA: TEdit
      Left = 67
      Top = 28
      Width = 146
      Height = 23
      Enabled = False
      TabOrder = 3
    end
    object dblcdProv: TwwDBLookupComboDlg
      Left = 220
      Top = 28
      Width = 87
      Height = 23
      CharCase = ecUpperCase
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taCenter
      Caption = 'Proveedores'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'PROV'#9'9'#9'C'#243'digo'#9'F'
        'PROVRUC'#9'10'#9'N'#186' RUC'#9'F'
        'PROVDES'#9'20'#9'Raz'#243'n Social'#9'F'
        'PROVABR'#9'20'#9'Abreviatura'#9'F')
      DataField = 'PROV'
      DataSource = DMLOG.dsNegociacion
      LookupTable = DMLOG.cdsProv
      LookupField = 'PROV'
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcdProvExit
    end
    object edtProv: TwwDBEdit
      Left = 309
      Top = 28
      Width = 180
      Height = 23
      CharCase = ecUpperCase
      Enabled = False
      MaxLength = 8
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcGrpArti: TwwDBLookupCombo
      Left = 16
      Top = 69
      Width = 46
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'GRARID'#9'15'#9'Grupos'#9'F'
        'GRARDES'#9'40'#9'Descripci'#243'n'#9'F')
      DataField = 'GRARID'
      DataSource = DMLOG.dsNegociacion
      LookupTable = DMLOG.cdsGArti
      LookupField = 'GRARID'
      Options = [loColLines, loTitles]
      DropDownCount = 15
      Enabled = False
      TabOrder = 7
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcGrpArtiExit
      OnNotInList = NotExists
    end
    object dblcFAM: TwwDBLookupCombo
      Left = 337
      Top = 68
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'FAMID'#9'3'#9'ID'#9'F'
        'FAMDES'#9'40'#9'Descripci'#243'n'#9'F')
      DataField = 'FAMID'
      DataSource = DMLOG.dsNegociacion
      LookupTable = DMLOG.cdsFAM
      LookupField = 'FAMID'
      Options = [loColLines, loTitles]
      DropDownCount = 15
      Enabled = False
      TabOrder = 9
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcFAMExit
      OnNotInList = NotExists
    end
    object dbeFAM: TwwDBEdit
      Left = 389
      Top = 68
      Width = 108
      Height = 23
      CharCase = ecUpperCase
      Enabled = False
      ReadOnly = True
      TabOrder = 10
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeGrpArti: TwwDBEdit
      Left = 63
      Top = 69
      Width = 272
      Height = 23
      CharCase = ecUpperCase
      Enabled = False
      ReadOnly = True
      TabOrder = 8
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcSUBFAM: TwwDBLookupCombo
      Left = 503
      Top = 68
      Width = 60
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'SFAMID'#9'8'#9'Id'#9'F'
        'SFAMDES'#9'40'#9'Sub-Familia'#9'F')
      DataField = 'SFAMID'
      DataSource = DMLOG.dsNegociacion
      LookupTable = DMLOG.cdsSUBFAM
      LookupField = 'SFAMID'
      Options = [loColLines, loTitles]
      DropDownCount = 12
      Enabled = False
      TabOrder = 11
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcSUBFAMExit
      OnNotInList = NotExists
    end
    object dbeSFAM: TwwDBEdit
      Left = 566
      Top = 68
      Width = 102
      Height = 23
      CharCase = ecUpperCase
      Enabled = False
      ReadOnly = True
      TabOrder = 12
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeGrupo2: TwwDBEdit
      Left = 496
      Top = 28
      Width = 165
      Height = 23
      DataField = 'GRUPO2'
      DataSource = DMLOG.dsNegociacion
      Enabled = False
      TabOrder = 6
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbcldArti: TwwDBLookupComboDlg
      Left = 15
      Top = 111
      Width = 113
      Height = 23
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Art'#237'culo'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'ARTID'#9'15'#9'ID'#9'F'
        'ARTDES'#9'40'#9'Articulo'#9'F')
      DataField = 'ARTID'
      DataSource = DMLOG.dsNegociacion
      LookupTable = DMLOG.cdsClnArti
      LookupField = 'ARTID'
      Enabled = False
      TabOrder = 13
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnExit = dbcldArtiExit
    end
    object dbeArti: TwwDBEdit
      Left = 129
      Top = 111
      Width = 296
      Height = 23
      DataField = 'ARTDES'
      Enabled = False
      ReadOnly = True
      TabOrder = 14
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeCantidad: TwwDBEdit
      Left = 432
      Top = 112
      Width = 121
      Height = 23
      DataField = 'ARTCNT'
      DataSource = DMLOG.dsNegociacion
      TabOrder = 15
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeRegistro: TwwDBEdit
      Left = 556
      Top = 112
      Width = 121
      Height = 23
      DataField = 'CCNOREG'
      DataSource = DMLOG.dsNegociacion
      Enabled = False
      TabOrder = 16
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcTMoneda: TwwDBLookupCombo
      Left = 19
      Top = 156
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TMONID'#9'3'#9'ID'#9'F'
        'TMONDES'#9'30'#9'Moneda'#9'F'
        'TMONABR'#9'8'#9'Abreviatura'#9'F')
      DataField = 'TMONID'
      DataSource = DMLOG.dsNegociacion
      LookupTable = DMLOG.cdsTMoneda
      LookupField = 'TMONID'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 17
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcTMonedaExit
      OnNotInList = NotExists
    end
    object edtTMoneda: TEdit
      Left = 68
      Top = 156
      Width = 96
      Height = 23
      Enabled = False
      TabOrder = 18
    end
    object dbePComCIGVOri: TwwDBEdit
      Left = 185
      Top = 205
      Width = 100
      Height = 21
      DataField = 'PCOMCIGVORI'
      DataSource = DMLOG.dsNegociacion
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 21
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = dbePComCIGVOriExit
    end
    object dbePCOSUnVent: TwwDBEdit
      Left = 185
      Top = 247
      Width = 100
      Height = 21
      DataField = 'PCOSUNVENT'
      DataSource = DMLOG.dsNegociacion
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 23
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeDesc1p: TwwDBEdit
      Left = 185
      Top = 268
      Width = 100
      Height = 21
      DataField = 'DESC1P'
      DataSource = DMLOG.dsNegociacion
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 24
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = Calcula
    end
    object dbeDesc2p: TwwDBEdit
      Left = 185
      Top = 289
      Width = 100
      Height = 21
      DataField = 'DESC2P'
      DataSource = DMLOG.dsNegociacion
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 25
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = Calcula
    end
    object dbeDesc3p: TwwDBEdit
      Left = 185
      Top = 310
      Width = 100
      Height = 21
      DataField = 'DESC3P'
      DataSource = DMLOG.dsNegociacion
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 26
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = Calcula
    end
    object dbeDesc4p: TwwDBEdit
      Left = 185
      Top = 331
      Width = 100
      Height = 21
      DataField = 'DESC4P'
      DataSource = DMLOG.dsNegociacion
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 27
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = Calcula
    end
    object dbeDesc5p: TwwDBEdit
      Left = 185
      Top = 351
      Width = 100
      Height = 21
      DataField = 'DESC5P'
      DataSource = DMLOG.dsNegociacion
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 28
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = Calcula
    end
    object dbePCosNeto: TwwDBEdit
      Left = 185
      Top = 372
      Width = 100
      Height = 21
      DataField = 'PCOSNETO'
      DataSource = DMLOG.dsNegociacion
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 29
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = Calcula
    end
    object dbeMargCosto: TwwDBEdit
      Left = 185
      Top = 413
      Width = 100
      Height = 21
      DataField = 'MARGCOSTO'
      DataSource = DMLOG.dsNegociacion
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 31
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = Calcula
    end
    object dbeDesc1e: TwwDBEdit
      Left = 185
      Top = 434
      Width = 100
      Height = 21
      DataField = 'DESC1E'
      DataSource = DMLOG.dsNegociacion
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 32
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = Calcula
    end
    object dbeDesc2e: TwwDBEdit
      Left = 185
      Top = 455
      Width = 100
      Height = 21
      DataField = 'DESC2E'
      DataSource = DMLOG.dsNegociacion
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 33
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = Calcula
    end
    object dbePVenta: TwwDBEdit
      Left = 185
      Top = 476
      Width = 100
      Height = 21
      DataField = 'PVENTA'
      DataSource = DMLOG.dsNegociacion
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 34
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeTCambio: TwwDBEdit
      Left = 276
      Top = 156
      Width = 121
      Height = 23
      DataField = 'TCAMBIO'
      DataSource = DMLOG.dsNegociacion
      TabOrder = 20
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbePComSIGVORI: TwwDBEdit
      Left = 185
      Top = 226
      Width = 100
      Height = 21
      DataField = 'PCOMSIGVORI'
      DataSource = DMLOG.dsNegociacion
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 22
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = dbePComSIGVORIExit
    end
    object dbeRelacion: TwwDBEdit
      Left = 168
      Top = 156
      Width = 101
      Height = 23
      DataField = 'RELACION'
      DataSource = DMLOG.dsNegociacion
      TabOrder = 19
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeDesc3e: TwwDBEdit
      Left = 185
      Top = 393
      Width = 100
      Height = 21
      DataField = 'DESC3E'
      DataSource = DMLOG.dsNegociacion
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 30
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = Calcula
    end
  end
end
