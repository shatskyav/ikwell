object FmPass: TFmPass
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1086#1083#1100
  ClientHeight = 244
  ClientWidth = 240
  Color = clBtnFace
  DefaultMonitor = dmPrimary
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btn1: TButton
    Left = 175
    Top = 74
    Width = 75
    Height = 25
    Caption = 'btn1'
    Default = True
    ModalResult = 1
    TabOrder = 2
    OnClick = btn1Click
  end
  object TouchKeyboard1: TTouchKeyboard
    AlignWithMargins = True
    Left = 3
    Top = 41
    Width = 234
    Height = 200
    Align = alBottom
    Color = clBtnFace
    GradientEnd = clAqua
    GradientStart = clBlue
    Layout = 'NumPad'
    ParentColor = False
  end
  object pass: TsMaskEdit
    Left = 56
    Top = 8
    Width = 137
    Height = 27
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    PasswordChar = '#'
    TabOrder = 0
    CheckOnExit = True
    BoundLabel.Indent = 0
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'Tahoma'
    BoundLabel.Font.Style = []
    BoundLabel.Layout = sclLeft
    BoundLabel.MaxWidth = 0
    BoundLabel.UseSkinColor = True
    SkinData.SkinSection = 'EDIT'
  end
end
