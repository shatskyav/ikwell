object FmProgress: TFmProgress
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 72
  ClientWidth = 544
  Color = clBtnFace
  DefaultMonitor = dmPrimary
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object TextLabel: TsLabel
    Left = 16
    Top = 8
    Width = 47
    Height = 13
    Caption = 'TextLabel'
  end
  object ProgressBar: TsGauge
    Left = 8
    Top = 27
    Width = 528
    Height = 25
    SkinData.SkinSection = 'GAUGE'
    ForeColor = clBlack
    Progress = 0
    Suffix = '%'
  end
end
