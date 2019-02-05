object fDetalleOrdTrab: TfDetalleOrdTrab
  Left = 373
  Top = 208
  Width = 572
  Height = 304
  Anchors = [akLeft]
  BorderIcons = [biSystemMenu]
  Caption = 'Detalle de Orden de Trabajo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grbDetalle: TGroupBox
    Left = 8
    Top = 17
    Width = 542
    Height = 192
    TabOrder = 0
    object Label2: TLabel
      Left = 6
      Top = 17
      Width = 82
      Height = 16
      Caption = 'Responsable'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 7
      Top = 57
      Width = 48
      Height = 16
      Caption = 'Trabajo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 9
      Top = 104
      Width = 102
      Height = 13
      Caption = '(max. 200 caracteres)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 336
      Top = 53
      Width = 142
      Height = 16
      Caption = 'Fecha Inicio de Trabajo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edtResponsable: TEdit
      Left = 60
      Top = 32
      Width = 256
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object dblcTipTrabajo2: TwwDBLookupComboDlg
      Left = 6
      Top = 72
      Width = 81
      Height = 21
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Trabajo'
      MaxWidth = 0
      MaxHeight = 209
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnExit = dblcTipTrabajo2Exit
    end
    object edtTrabajo: TEdit
      Left = 92
      Top = 71
      Width = 224
      Height = 21
      Enabled = False
      TabOrder = 3
    end
    object memDescripcion: TMemo
      Left = 6
      Top = 119
      Width = 309
      Height = 58
      MaxLength = 200
      TabOrder = 4
      OnKeyPress = memDescripcionKeyPress
    end
    object GroupBox5: TGroupBox
      Left = 321
      Top = 104
      Width = 212
      Height = 73
      Caption = 'Datos Generales de OT'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      object Label8: TLabel
        Left = 10
        Top = 24
        Width = 83
        Height = 16
        Caption = 'Fec. Creaci'#243'n'
      end
      object Label9: TLabel
        Left = 110
        Top = 25
        Width = 84
        Height = 16
        Caption = 'Usu. Creaci'#243'n'
      end
      object edtFecCreacion: TEdit
        Left = 10
        Top = 40
        Width = 93
        Height = 24
        Color = 11599871
        TabOrder = 0
      end
      object edtUsuCreacion: TEdit
        Left = 110
        Top = 40
        Width = 95
        Height = 24
        Color = 11599871
        TabOrder = 1
      end
    end
    object dblcResponsable: TwwDBLookupComboDlg
      Left = 6
      Top = 32
      Width = 51
      Height = 21
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnExit = dblcResponsableExit
    end
    object dbfFecInicio: TwwDBDateTimePicker
      Left = 335
      Top = 70
      Width = 96
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 6
    end
  end
  object Panel1: TPanel
    Left = 376
    Top = 3
    Width = 168
    Height = 37
    Enabled = False
    TabOrder = 1
    object edtOrdTrebajo: TEdit
      Left = 3
      Top = 3
      Width = 163
      Height = 32
      Color = 11599871
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object grbControles: TGroupBox
    Left = 8
    Top = 211
    Width = 543
    Height = 47
    TabOrder = 2
    object btnGrabar: TBitBtn
      Left = 421
      Top = 8
      Width = 31
      Height = 32
      Hint = 'GRABAR RECIBO'
      TabOrder = 0
      OnClick = btnGrabarClick
      Glyph.Data = {
        8A010000424D8A01000000000000760000002800000017000000170000000100
        0400000000001401000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333303000077777777777770003300000078888888888880000300000
        0780088888888800003000000780088888888800003000000780088888888800
        0030000007888888888888000030000000000000000000000030000000000000
        0000000000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000
        FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF00
        00300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFF
        FFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000
        FFFFFFFFFFFFFF07703000009999999999999907703000009999999999999900
        0030300099999999999999000330}
    end
  end
  object EdtCiaid: TEdit
    Left = 12
    Top = 8
    Width = 27
    Height = 21
    Color = 11599871
    Enabled = False
    TabOrder = 3
  end
  object EdtCia: TEdit
    Left = 43
    Top = 8
    Width = 217
    Height = 21
    Color = 11599871
    Enabled = False
    TabOrder = 4
  end
  object BtnSalir: TBitBtn
    Left = 473
    Top = 224
    Width = 71
    Height = 25
    Hint = 'SALIR'
    Caption = 'Salir'
    TabOrder = 5
    OnClick = BtnSalirClick
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000000000000000000000000000000000003F00007F0000
      7F3F007F3F007F3F007F3F007F3F007F3F007F3F000000003F00007F00007F00
      007F00007F00003F00007F0000FF0000FF3F00FF7F00FF7F00FF7F00FF7F00FF
      7F00FF7F007F7F009F9F00BF0000FF0000FF0000FF00007F00007F0000FF0000
      FF0000FF3F00FF7F00FF7F00FF7F00FF7F00FF7F007F7F00BFBF00606000BF00
      00FF0000FF00007F00003F00007F00007F00007F00007F3F007F3F00FFBF00FF
      BF00FFBF007F7F00BFBF008080006060007F00007F00003F0000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF000000FFFF00FFFF00FFFF007F7F00BFBF008080008080
      00404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000040404040
      40404040407F7F00BFBF00808000808000404040FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF2020000000008080808080808080807F7F00BFBF008080008080
      00404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F0060600060606080
      80808080807F7F009F9F00202020808000404040FFFFFFFFFFFF000000000000
      0000000000007F7F00DFDF006060006060608080807F7F009F9F003F3F3F8080
      00404040FFFFFFFFFFFF5F5F00BFBF00BFBF00BFBF00DFDF00FFFF00DFDF0060
      60006060607F7F00BFBF00808000808000404040FFFFFFFFFFFF7F7F00FFFF3F
      FFFF7FFFFF7FFFFF7FFFFFBFFFFF3F7F7F006060607F7F00BFBF008080008080
      00404040FFFFFFFFFFFF0000000000000000000000007F7F00FFFF3F7F7F0060
      60608080807F7F00BFBF00808000808000404040FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF7F7F007F7F006060608080808080807F7F3FBFBF008080008080
      00404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF20200000000080808080
      8080808080606060BFBF7F9F9F00808000404040FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF000000808080808080808080808080606060BFBF7F9F9F
      00404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000040404040
      40404040404040404040402020207F7F3F202020FFFFFFFFFFFF}
  end
end
