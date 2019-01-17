inherited FrmEstaciones: TFrmEstaciones
  Caption = 'FrmEmpresas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcCatalogo: TcxPageControl
    inherited cxTabSheet1: TcxTabSheet
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitWidth = 616
      ExplicitHeight = 416
      inherited dbgCatalogo: TcxGrid
        LevelTabs.Style = 5
        inherited dbgCatalogoDBTableView1: TcxGridDBTableView
          object dbgCatalogoDBTableView1RecID: TcxGridDBColumn
            DataBinding.FieldName = 'RecID'
            Visible = False
          end
          object dbgCatalogoDBTableView1EmpresaID: TcxGridDBColumn
            Caption = 'Empresa'
            DataBinding.FieldName = 'IDESTACION'
          end
          object dbgCatalogoDBTableView1Nombre: TcxGridDBColumn
            DataBinding.FieldName = 'Nombre'
          end
          object dbgCatalogoDBTableView1RazonSocial: TcxGridDBColumn
            DataBinding.FieldName = 'RazonSocial'
          end
          object dbgCatalogoDBTableView1RFC: TcxGridDBColumn
            DataBinding.FieldName = 'RFC'
          end
          object dbgCatalogoDBTableView1Colonia: TcxGridDBColumn
            DataBinding.FieldName = 'Colonia'
          end
          object dbgCatalogoDBTableView1Ciudad: TcxGridDBColumn
            DataBinding.FieldName = 'Ciudad'
          end
          object dbgCatalogoDBTableView1CodigoPostal: TcxGridDBColumn
            DataBinding.FieldName = 'CodigoPostal'
          end
          object dbgCatalogoDBTableView1Host: TcxGridDBColumn
            DataBinding.FieldName = 'Host'
          end
          object dbgCatalogoDBTableView1CuentaContable: TcxGridDBColumn
            DataBinding.FieldName = 'CuentaContable'
          end
          object dbgCatalogoDBTableView1Impuesto: TcxGridDBColumn
            DataBinding.FieldName = 'Impuesto'
          end
        end
      end
    end
    inherited cxTabSheet2: TcxTabSheet
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitWidth = 616
      ExplicitHeight = 416
      object GrpBoxDatos: TcxGroupBox
        Left = 1
        Top = 8
        Hint = ''
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Height = 321
        Width = 615
        object TxtNoEstacion: TcxDBTextEdit
          Left = 16
          Top = 38
          Hint = ''
          DataBinding.DataField = 'IDESTACION'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          Properties.ReadOnly = False
          Style.BorderStyle = ebsUltraFlat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 0
          Width = 81
        end
        object LblNoEstacion: TcxLabel
          Left = 16
          Top = 22
          Hint = ''
          Caption = 'Estaci'#243'n'
          Style.BorderStyle = ebsNone
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object LblDireccion: TcxLabel
          Left = 16
          Top = 100
          Hint = ''
          Caption = 'Direcci'#243'n'
          Style.BorderStyle = ebsNone
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object LblRFC: TcxLabel
          Left = 16
          Top = 140
          Hint = ''
          Caption = 'R.F.C.'
          Style.BorderStyle = ebsNone
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object LblHost: TcxLabel
          Left = 183
          Top = 139
          Hint = ''
          Caption = 'Host'
          Style.BorderStyle = ebsNone
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object LblNombre: TcxLabel
          Left = 103
          Top = 22
          Hint = ''
          Caption = 'Nombre'
          Style.BorderStyle = ebsNone
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object TxtNombre: TcxDBTextEdit
          Left = 103
          Top = 38
          Hint = ''
          DataBinding.DataField = 'Nombre'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          Style.BorderStyle = ebsUltraFlat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 1
          Width = 474
        end
        object TxtDireccion: TcxDBTextEdit
          Left = 16
          Top = 116
          Hint = ''
          DataBinding.DataField = 'Colonia'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          Style.BorderStyle = ebsUltraFlat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 3
          Width = 561
        end
        object TxtRFC: TcxDBTextEdit
          Left = 16
          Top = 156
          Hint = ''
          DataBinding.DataField = 'RFC'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          Style.BorderStyle = ebsUltraFlat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 4
          Width = 161
        end
        object TxtHost: TcxDBTextEdit
          Left = 183
          Top = 156
          Hint = ''
          DataBinding.DataField = 'Host'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          Style.BorderStyle = ebsUltraFlat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 5
          Width = 169
        end
        object LblCuentaContable: TcxLabel
          Left = 232
          Top = 219
          Hint = ''
          Caption = 'Cuenta Contable'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object TxtCuentaContable: TcxDBTextEdit
          Left = 232
          Top = 236
          Hint = ''
          DataBinding.DataField = 'CuentaContable'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          Style.BorderStyle = ebsUltraFlat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 8
          Width = 169
        end
        object TxtIva: TcxDBTextEdit
          Left = 16
          Top = 236
          Hint = ''
          DataBinding.DataField = 'Impuesto'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          Style.BorderStyle = ebsUltraFlat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 7
          Width = 140
        end
        object LblImpuento: TcxLabel
          Left = 16
          Top = 219
          Hint = ''
          Caption = 'Porcentaje de Impuesto'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxLabel2: TcxLabel
          Left = 16
          Top = 61
          Hint = ''
          Caption = 'Razon Social'
          Style.BorderStyle = ebsNone
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object cxDBTextEdit2: TcxDBTextEdit
          Left = 16
          Top = 77
          Hint = ''
          DataBinding.DataField = 'RazonSocial'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          Style.BorderStyle = ebsUltraFlat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 2
          Width = 561
        end
      end
    end
  end
  inherited cdsCatalogo: TDAMemDataTable
    Fields = <
      item
        Name = 'IDESTACION'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'NOMBRE'
        DataType = datString
        Size = 100
      end
      item
        Name = 'RAZONSOCIAL'
        DataType = datString
        Size = 100
      end
      item
        Name = 'RFC'
        DataType = datString
        Size = 30
      end
      item
        Name = 'HOST'
        DataType = datString
        Size = 30
      end
      item
        Name = 'CUENTACONTABLE'
        DataType = datString
        Size = 20
      end
      item
        Name = 'IMPUESTO'
        DataType = datFloat
      end
      item
        Name = 'CALLE'
        DataType = datString
        Size = 60
      end
      item
        Name = 'COLONIA'
        DataType = datString
        Size = 30
      end
      item
        Name = 'NOEXTERIOR'
        DataType = datString
        Size = 10
      end
      item
        Name = 'NOINTERIOR'
        DataType = datString
        Size = 10
      end
      item
        Name = 'CODIGOPOSTAL'
        DataType = datString
        Size = 10
      end
      item
        Name = 'MUNICIPIO'
        DataType = datString
        Size = 30
      end
      item
        Name = 'LOCALIDAD'
        DataType = datString
        Size = 30
      end
      item
        Name = 'ESTADO'
        DataType = datString
        Size = 30
      end
      item
        Name = 'EXCALLE'
        DataType = datString
        Size = 60
      end
      item
        Name = 'EXCOLONIA'
        DataType = datString
        Size = 30
      end
      item
        Name = 'EXNOEXTERIOR'
        DataType = datString
        Size = 10
      end
      item
        Name = 'EXNOINTERIOR'
        DataType = datString
        Size = 10
      end
      item
        Name = 'EXCODIGOPOSTAL'
        DataType = datString
        Size = 10
      end
      item
        Name = 'EXMUNICIPIO'
        DataType = datString
        Size = 30
      end
      item
        Name = 'EXLOCALIDAD'
        DataType = datString
        Size = 30
      end
      item
        Name = 'EXESTADO'
        DataType = datString
        Size = 30
      end
      item
        Name = 'NOAPROBACION'
        DataType = datInteger
      end
      item
        Name = 'FECHAAPROBACION'
        DataType = datInteger
      end
      item
        Name = 'NOAPROBACIONES'
        DataType = datString
        Size = 150
      end
      item
        Name = 'VERSIONCFD'
        DataType = datInteger
      end
      item
        Name = 'REGIMENFISCAL'
        DataType = datString
        Size = 150
      end
      item
        Name = 'CODIGOFACTURA'
        DataType = datString
        Size = 2
      end
      item
        Name = 'FORMATOFACTURAWEB'
        DataType = datString
        Size = 100
      end
      item
        Name = 'SERIEENLINEA'
        DataType = datString
        Size = 5
      end
      item
        Name = 'TELEFONO'
        DataType = datString
        Size = 20
      end
      item
        Name = 'IDESTACIONBANCARIA'
        DataType = datInteger
      end
      item
        Name = 'SERIEBANCARIA'
        DataType = datString
        Size = 5
      end
      item
        Name = 'LOGOESTACION'
        DataType = datBlob
      end
      item
        Name = 'PAIS'
        DataType = datString
        Size = 100
      end
      item
        Name = 'EXPAIS'
        DataType = datString
        Size = 100
      end
      item
        Name = 'EXREFERENCIA'
        DataType = datString
        Size = 100
      end>
    LogicalName = 'dbo.ESTACION'
    RemoteDataAdapter = DM.RemoteDataAdapter
    OnNewRecord = cdsCatalogoNewRecord
  end
  inherited dsCatalogo: TDADataSource
    DataSet = cdsCatalogo.Dataset
  end
end