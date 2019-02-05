object FToolNeg: TFToolNeg
  Left = 259
  Top = 294
  Width = 656
  Height = 66
  BorderIcons = [biSystemMenu]
  Caption = 'Negociaciones'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 15
  object pnlcomandos: TPanel
    Left = 0
    Top = 0
    Width = 648
    Height = 32
    Align = alClient
    BevelOuter = bvNone
    Color = 12904163
    TabOrder = 0
    object bbtnReq: TBitBtn
      Left = 17
      Top = 6
      Width = 160
      Height = 25
      Hint = 'Genera Registro desde Requisiciones'
      Caption = 'Desde &Requisiciones       '
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = bbtnReqClick
    end
    object bbtnMArt: TBitBtn
      Left = 187
      Top = 6
      Width = 160
      Height = 25
      Hint = 'Genera Registro desde Maestro de Art'#237'culos'
      Caption = 'Desde &Maestro de Art'#237'culos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = bbtnMArtClick
    end
    object bbtnGenOC: TBitBtn
      Left = 456
      Top = 6
      Width = 169
      Height = 25
      Hint = 'Genera la Orden de Compra'
      Caption = 'Genera &Ord. de Compra'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = bbtnGenOCClick
    end
  end
end
