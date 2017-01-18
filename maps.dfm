object fmMaps: TfmMaps
  Left = 0
  Top = 0
  Caption = #1050#1072#1088#1090#1072
  ClientHeight = 506
  ClientWidth = 801
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 801
    Height = 41
    Align = alTop
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
  end
  object wb1: TWebBrowser
    Left = 0
    Top = 41
    Width = 801
    Height = 465
    Align = alClient
    TabOrder = 1
    ExplicitLeft = -8
    ExplicitTop = 47
    ControlData = {
      4C000000C95200000F3000000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object gmm1: TGMMarker
    Language = Russian
    Map = gmp1
    VisualObjects = <
      item
        Title = 'TMarker'
        ShowInfoWinMouseOver = True
      end>
    Left = 56
    Top = 176
  end
  object gmp1: TGMMap
    Language = Russian
    Precision = 8
    RequiredProp.Center.Lat = 48.916464000000000000
    RequiredProp.Center.Lng = 32.949367000000000000
    RequiredProp.MapType = mtOSM
    RequiredProp.Zoom = 7
    AfterPageLoaded = gmp1AfterPageLoaded
    OnRightClick = gmp1RightClick
    WebBrowser = wb1
    Left = 64
    Top = 88
  end
  object myMaps: TMyQuery
    Connection = fmMain.MyConn
    SQL.Strings = (
      'select * from maps'
      'where id=:id')
    Left = 504
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end>
  end
end
