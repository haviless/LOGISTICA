object FTransfReq: TFTransfReq
  Left = 291
  Top = 217
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Transferencia de Requerimiento'
  ClientHeight = 257
  ClientWidth = 484
  Color = 14869218
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 188
    Width = 484
    Height = 69
    Align = alBottom
    Color = clSilver
    TabOrder = 1
    object Z2bbtnRegOk: TBitBtn
      Left = 115
      Top = 20
      Width = 116
      Height = 28
      Hint = 'Confirma Actualizaci'#243'n'
      Caption = 'Transferencia'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = Z2bbtnRegOkClick
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
    object Z2bbtnRegCanc: TBitBtn
      Left = 250
      Top = 20
      Width = 120
      Height = 28
      Hint = 'Cancela Actualizaci'#243'n'
      Caption = '&Salir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = Z2bbtnRegCancClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
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
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 484
    Height = 180
    Align = alTop
    BevelWidth = 2
    BorderStyle = bsSingle
    Color = 14869218
    TabOrder = 0
    object lblArticulo: TLabel
      Left = 8
      Top = 145
      Width = 459
      Height = 22
      AutoSize = False
      Caption = 'Articulo'
      Visible = False
      WordWrap = True
    end
    object SpeedButton1: TSpeedButton
      Left = 424
      Top = 144
      Width = 23
      Height = 25
      Visible = False
      OnClick = SpeedButton1Click
    end
    object lblfecha: TLabel
      Left = 6
      Top = 5
      Width = 3
      Height = 15
      Caption = '.'
    end
    object lblHora: TLabel
      Left = 470
      Top = 5
      Width = 3
      Height = 15
      Alignment = taRightJustify
      Caption = '.'
    end
    object Bevel1: TBevel
      Left = 88
      Top = 19
      Width = 305
      Height = 81
    end
    object pbProceso: TProgressBar
      Left = 19
      Top = 120
      Width = 441
      Height = 13
      Max = 0
      TabOrder = 0
      Visible = False
    end
    object Memo1: TMemo
      Left = 408
      Top = 127
      Width = 57
      Height = 34
      TabOrder = 1
      Visible = False
    end
    object Anime: TAnimate
      Left = 104
      Top = 30
      Width = 272
      Height = 60
      CommonAVI = aviCopyFiles
      StopFrame = 34
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '\\APLICACIONES\SOLApli\TransfReq'
    Left = 426
    Top = 138
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 18
    Top = 58
  end
end
