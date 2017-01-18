object fmObjects: TfmObjects
  Left = 0
  Top = 0
  Caption = #1054#1073#1100#1077#1082#1090#1099
  ClientHeight = 539
  ClientWidth = 816
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grpVibor: TsGroupBox
    Left = 0
    Top = 0
    Width = 816
    Height = 57
    Align = alTop
    Caption = #1042#1099#1073#1086#1088' '#1086#1073#1100#1077#1082#1090#1086#1074
    TabOrder = 0
    SkinData.SkinSection = 'GROUPBOX'
    object lStatus: TsLabel
      Left = 89
      Top = 16
      Width = 35
      Height = 13
      Caption = #1057#1090#1072#1090#1091#1089
    end
    object lRegion: TsLabel
      Left = 262
      Top = 16
      Width = 43
      Height = 13
      Caption = #1054#1073#1083#1072#1089#1090#1100
    end
    object sLabel1: TsLabel
      Left = 453
      Top = 16
      Width = 31
      Height = 13
      Caption = #1043#1086#1088#1086#1076
    end
    object sLabel2: TsLabel
      Left = 636
      Top = 16
      Width = 72
      Height = 13
      Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
    end
    object sLabel3: TsLabel
      Left = 10
      Top = 16
      Width = 20
      Height = 13
      Caption = #1050#1086#1076
    end
    object cbStatus: TDBComboBoxEh
      Left = 89
      Top = 30
      Width = 167
      Height = 21
      EditButtons = <>
      TabOrder = 0
      Visible = True
      OnChange = cbStatusChange
      OnDblClick = cbStatusDblClick
    end
    object cbRegion: TDBComboBoxEh
      Left = 262
      Top = 30
      Width = 185
      Height = 21
      EditButtons = <>
      TabOrder = 1
      Visible = True
      OnChange = cbRegionChange
      OnDblClick = cbRegionDblClick
    end
    object cbCity: TDBComboBoxEh
      Left = 453
      Top = 30
      Width = 177
      Height = 21
      EditButtons = <>
      TabOrder = 2
      Visible = True
      OnChange = cbCityChange
      OnDblClick = cbCityDblClick
    end
    object cbUser: TDBComboBoxEh
      Left = 636
      Top = 30
      Width = 177
      Height = 21
      EditButtons = <>
      TabOrder = 3
      Visible = True
      OnChange = cbUserChange
      OnDblClick = cbUserDblClick
    end
    object cbId: TDBComboBoxEh
      Left = 10
      Top = 30
      Width = 73
      Height = 21
      EditButtons = <>
      TabOrder = 4
      Visible = True
      OnChange = cbIdChange
    end
  end
  object grpObjects: TsGroupBox
    Left = 0
    Top = 57
    Width = 816
    Height = 482
    Align = alClient
    Caption = #1054#1073#1100#1077#1082#1090#1099
    TabOrder = 1
    SkinData.SkinSection = 'GROUPBOX'
    object gObject: TDBGridEh
      Left = 2
      Top = 15
      Width = 812
      Height = 424
      Align = alClient
      AutoFitColWidths = True
      DataGrouping.GroupLevels = <>
      DataSource = dsObject
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      FooterRowCount = 1
      IndicatorOptions = []
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
      PopupMenu = pm1
      ReadOnly = True
      STFilter.InstantApply = False
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      UseMultiTitle = True
      OnApplyFilter = gObjectApplyFilter
      OnDblClick = sBitBtn1Click
      Columns = <
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'id'
          Footers = <>
          Title.Caption = #1050#1086#1076
          Width = 40
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'date_ins'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'region'
          Footers = <>
          Title.Caption = #1054#1073#1083#1072#1089#1090#1100
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'city'
          Footers = <>
          Title.Caption = #1043#1086#1088#1086#1076
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'rayon'
          Footers = <>
          Title.Caption = #1056#1072#1081#1086#1085
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'street'
          Footers = <>
          Title.Caption = #1059#1083#1080#1094#1072
          Width = 100
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'dom'
          Footers = <>
          Title.Caption = #1044#1086#1084
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'orientir'
          Footers = <>
          Title.Caption = #1054#1088#1080#1077#1085#1090#1080#1088
        end
        item
          EditButtons = <>
          FieldName = 'arendodatel'
          Footers = <>
          Title.Caption = #1040#1088#1077#1085#1076#1086#1076#1072#1090#1077#1083#1100
          Width = 100
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'price'
          Footers = <>
          Title.Caption = #1062#1077#1085#1072
          Width = 60
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'kvm'
          Footers = <>
          Title.Caption = '1 '#1082#1074'.'#1084
          Width = 50
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object sp1: TsPanel
      Left = 2
      Top = 439
      Width = 812
      Height = 41
      Align = alBottom
      TabOrder = 1
      SkinData.SkinSection = 'PANEL'
      object sBitBtn1: TsBitBtn
        Left = 8
        Top = 6
        Width = 193
        Height = 30
        Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1082#1072#1088#1090#1099' '#1086#1073#1100#1077#1082#1090#1072
        TabOrder = 0
        OnClick = sBitBtn1Click
        SkinData.SkinSection = 'BUTTON'
        ImageIndex = 6
        Images = fmMain.il1
      end
      object sbtNew: TsBitBtn
        Left = 224
        Top = 6
        Width = 193
        Height = 30
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1099#1081' '#1086#1073#1100#1077#1082#1090
        TabOrder = 1
        OnClick = sbtNewClick
        SkinData.SkinSection = 'BUTTON'
        ImageIndex = 5
        Images = fmMain.il1
      end
      object bt1: TsBitBtn
        Left = 432
        Top = 6
        Width = 201
        Height = 30
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1086#1073#1100#1077#1082#1090
        TabOrder = 2
        OnClick = N1Click
        SkinData.SkinSection = 'BUTTON'
        ImageIndex = 7
        Images = fmMain.il1
      end
    end
  end
  object mtObject: TMemTableEh
    Filtered = True
    Params = <>
    DataDriver = ddObject
    Left = 504
    Top = 256
  end
  object ddObject: TDataSetDriverEh
    ProviderDataSet = myObject
    Left = 504
    Top = 200
  end
  object myObject: TMyQuery
    SQLInsert.Strings = (
      'INSERT INTO Object'
      
        '  (id, date, tip_ob, status, region, city, rayon, street, dom, o' +
        'rientir, floor, floors, pl, pl_t, pl_m, sanuzel, voda, kanal, te' +
        'plo, vent, Kond, electro_kvt, stupen, pandus, stena, bti, arendo' +
        'datel, istok, position, price, user, date_prov, date_osm, electr' +
        'o_fz, arenda_beg, arenda_end, ot_boss, date_close, pr_close, inf' +
        'o)'
      'VALUES'
      
        '  (:id, :date, :tip_ob, :status, :region, :city, :rayon, :street' +
        ', :dom, :orientir, :floor, :floors, :pl, :pl_t, :pl_m, :sanuzel,' +
        ' :voda, :kanal, :teplo, :vent, :Kond, :electro_kvt, :stupen, :pa' +
        'ndus, :stena, :bti, :arendodatel, :istok, :position, :price, :us' +
        'er, :date_prov, :date_osm, :electro_fz, :arenda_beg, :arenda_end' +
        ', :ot_boss, :date_close, :pr_close, :info)')
    SQLDelete.Strings = (
      'DELETE FROM Object'
      'WHERE'
      '  id = :Old_id')
    SQLUpdate.Strings = (
      'UPDATE Object'
      'SET'
      
        '  id = :id, date = :date, tip_ob = :tip_ob, status = :status, re' +
        'gion = :region, city = :city, rayon = :rayon, street = :street, ' +
        'dom = :dom, orientir = :orientir, floor = :floor, floors = :floo' +
        'rs, pl = :pl, pl_t = :pl_t, pl_m = :pl_m, sanuzel = :sanuzel, vo' +
        'da = :voda, kanal = :kanal, teplo = :teplo, vent = :vent, Kond =' +
        ' :Kond, electro_kvt = :electro_kvt, stupen = :stupen, pandus = :' +
        'pandus, stena = :stena, bti = :bti, arendodatel = :arendodatel, ' +
        'istok = :istok, position = :position, price = :price, user = :us' +
        'er, date_prov = :date_prov, date_osm = :date_osm, electro_fz = :' +
        'electro_fz, arenda_beg = :arenda_beg, arenda_end = :arenda_end, ' +
        'ot_boss = :ot_boss, date_close = :date_close, pr_close = :pr_clo' +
        'se, info = :info'
      'WHERE'
      '  id = :Old_id')
    SQLRefresh.Strings = (
      
        'SELECT id, date, tip_ob, status, region, city, rayon, street, do' +
        'm, orientir, floor, floors, pl, pl_t, pl_m, sanuzel, voda, kanal' +
        ', teplo, vent, Kond, electro_kvt, stupen, pandus, stena, bti, ar' +
        'endodatel, istok, position, price, user, date_prov, date_osm, el' +
        'ectro_fz, arenda_beg, arenda_end, ot_boss, date_close, pr_close,' +
        ' info FROM Object'
      'WHERE'
      '  id = :id')
    SQLLock.Strings = (
      'SELECT * FROM Object'
      'WHERE'
      '  id = :Old_id'
      'FOR UPDATE')
    Connection = fmMain.MyConn
    SQL.Strings = (
      'select o.*,'
      ' if (o.pl=0,0,round(o.price/o.pl,2)) kvm'
      'from object o'
      'where ( id     = :id     or :id     = 0)'
      '  and ( status = :status or :status = 0)'
      '  and ( region = :region or :region = 0)'
      '  and ( city   = :city   or :city   = 0)'
      '  and ( user   = :user   or :user   = 0 or user = 0)'
      ''
      ''
      'order by date_ins desc')
    Filtered = True
    FilterOptions = [foCaseInsensitive, foNoPartialCompare]
    UpdatingTable = 'Object'
    Left = 504
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'region'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'region'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'city'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'city'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'user'
      end
      item
        DataType = ftUnknown
        Name = 'user'
      end>
  end
  object dsObject: TMyDataSource
    DataSet = myObject
    Left = 504
    Top = 312
  end
  object myCity: TMyQuery
    Connection = fmMain.MyConn
    SQL.Strings = (
      'select * from city')
    Left = 608
    Top = 144
  end
  object dsCity: TMyDataSource
    DataSet = myCity
    Left = 648
    Top = 144
  end
  object pm1: TPopupMenu
    Left = 240
    Top = 152
    object N1: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1086#1073#1100#1077#1082#1090
      OnClick = N1Click
    end
  end
end
