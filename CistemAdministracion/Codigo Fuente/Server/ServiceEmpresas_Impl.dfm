object ServiceEmpresas: TServiceEmpresas
  OldCreateOrder = True
  OnCreate = DataAbstractServiceCreate
  SessionManager = ServerDataModule.SessionManager
  ServiceSchema = Schema
  ServiceDataStreamer = DataStreamer
  ExportedDataTables = <>
  AllowWhereSQL = True
  Height = 243
  Width = 332
  object Schema: TDASchema
    ConnectionManager = ServerDataModule.ConnectionManager
    Datasets = <
      item
        Params = <>
        Statements = <
          item
            Connection = 'NorthAmericanGreenHouse'
            ConnectionType = 'MSSQL'
            Default = True
            TargetTable = 'dbo.USUARIO'
            StatementType = stAutoSQL
            ColumnMappings = <
              item
                DatasetField = 'IDEMPLEADO'
                TableField = 'IDEMPLEADO'
              end
              item
                DatasetField = 'CODIGO'
                TableField = 'CODIGO'
              end
              item
                DatasetField = 'NOMBRE'
                TableField = 'NOMBRE'
              end
              item
                DatasetField = 'USERNAME'
                TableField = 'USERNAME'
              end
              item
                DatasetField = 'USERPASSWORD'
                TableField = 'USERPASSWORD'
              end
              item
                DatasetField = 'FIRMADEFAULT'
                TableField = 'FIRMADEFAULT'
              end>
          end>
        Name = 'dbo.usuarios'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <
          item
            Name = 'IDEMPLEADO'
            DataType = datInteger
          end
          item
            Name = 'CODIGO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'NOMBRE'
            DataType = datString
            Size = 70
          end
          item
            Name = 'USERNAME'
            DataType = datString
            Size = 10
          end
          item
            Name = 'USERPASSWORD'
            DataType = datString
            Size = 10
          end
          item
            Name = 'FIRMADEFAULT'
            DataType = datBlob
          end>
      end
      item
        Params = <
          item
            Name = 'EstacionID'
            DataType = datInteger
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'NorthAmericanGreenHouse'
            ConnectionType = 'MSSQL'
            Default = True
            SQL = 
              'select top 1 *'#10'from tipocambio'#10'where EstacionID=:EstacionID'#10'orde' +
              'r by Fecha desc'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'TipoCambioID'
                TableField = 'TipoCambioID'
              end
              item
                DatasetField = 'TipoCambio'
                TableField = 'TipoCambio'
              end
              item
                DatasetField = 'EstacionID'
                TableField = 'EstacionID'
              end
              item
                DatasetField = 'Fecha'
                TableField = 'Fecha'
              end>
          end>
        Name = 'ObtenerTipoCambioPorEstacion'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <
          item
            Name = 'TipoCambioID'
            DataType = datInteger
          end
          item
            Name = 'TipoCambio'
            DataType = datFloat
          end
          item
            Name = 'EstacionID'
            DataType = datInteger
          end
          item
            Name = 'Fecha'
            DataType = datDateTime
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'NorthAmericanGreenHouse'
            ConnectionType = 'MSSQL'
            Default = True
            TargetTable = 'dbo.TipoCambio'
            StatementType = stAutoSQL
            ColumnMappings = <
              item
                DatasetField = 'TipoCambioID'
                TableField = 'TipoCambioID'
              end
              item
                DatasetField = 'TipoCambio'
                TableField = 'TipoCambio'
              end
              item
                DatasetField = 'EstacionID'
                TableField = 'EstacionID'
              end
              item
                DatasetField = 'Fecha'
                TableField = 'Fecha'
              end>
          end>
        Name = 'dbo.TipoCambio'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <
          item
            Name = 'TipoCambioID'
            DataType = datInteger
          end
          item
            Name = 'TipoCambio'
            DataType = datFloat
          end
          item
            Name = 'EstacionID'
            DataType = datInteger
          end
          item
            Name = 'Fecha'
            DataType = datDateTime
          end>
      end
      item
        Params = <
          item
            Name = 'Usuario'
            DataType = datString
            Size = 65536
            Value = 'admin'
            ParamType = daptInput
          end
          item
            Name = 'Clave'
            DataType = datString
            Size = 65536
            Value = 'admin'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'NorthAmericanGreenHouse'
            ConnectionType = 'MSSQL'
            Default = True
            SQL = 
              'SELECT IDEMPLEADO, NOMBRE'#10'FROM USUARIO'#10'WHERE (USERNAME = :Usuari' +
              'o) AND (USERPASSWORD = :Clave)'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDEMPLEADO'
                TableField = 'IDEMPLEADO'
              end
              item
                DatasetField = 'NOMBRE'
                TableField = 'NOMBRE'
              end>
          end>
        Name = 'spValidaUsuario'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <
          item
            Name = 'IDEMPLEADO'
            DataType = datInteger
          end
          item
            Name = 'NOMBRE'
            DataType = datString
            Size = 70
          end>
      end
      item
        Params = <
          item
            Name = 'UsuarioID'
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'NorthAmericanGreenHouse'
            ConnectionType = 'MSSQL'
            Default = True
            SQL = 
              'DECLARE @UsuarioID AS INT'#10#10'SELECT @UsuarioID = :UsuarioID'#10#10'SELEC' +
              'T DISTINCT Opcion.OpcionID, Descripcion FROM'#10'       (SELECT     ' +
              'OpcionID'#10'        FROM       Acceso'#10'        WHERE usuarioid = @Us' +
              'uarioID'#10#10'        UNION'#10#10'        SELECT     OpcionID'#10'        FROM' +
              '       GrupoAcceso'#10'        WHERE GrupoID IN (SELECT GrupoID FROM' +
              ' GrupoUsuario'#10'                          WHERE UsuarioID = @Usuar' +
              'ioID)) SelectUnion  INNER JOIN'#10'                          Opcion ' +
              'ON Opcion.OpcionID = SelectUnion.OpcionID'#10'ORDER BY Opcion.Opcion' +
              'ID'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'OpcionID'
                TableField = 'OpcionID'
              end
              item
                DatasetField = 'Descripcion'
                TableField = 'Descripcion'
              end>
          end>
        Name = 'spAccesos'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <
          item
            Name = 'OpcionID'
            DataType = datInteger
          end
          item
            Name = 'Descripcion'
            DataType = datString
            Size = 50
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'NorthAmericanGreenHouse'
            ConnectionType = 'MSSQL'
            Default = True
            TargetTable = 'dbo.Acceso'
            StatementType = stAutoSQL
            ColumnMappings = <
              item
                DatasetField = 'UsuarioID'
                TableField = 'UsuarioID'
              end
              item
                DatasetField = 'OpcionID'
                TableField = 'OpcionID'
              end>
          end>
        Name = 'dbo.Acceso'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <
          item
            Name = 'UsuarioID'
            DataType = datInteger
          end
          item
            Name = 'OpcionID'
            DataType = datInteger
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'NorthAmericanGreenHouse'
            ConnectionType = 'MSSQL'
            Default = True
            TargetTable = 'dbo.Opcion'
            SQL = 'SELECT * FROM dbo.Opcion'#10'Order by OpcionID asc'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'OpcionID'
                TableField = 'OpcionID'
              end
              item
                DatasetField = 'Descripcion'
                TableField = 'Descripcion'
              end
              item
                DatasetField = 'ImageIndex'
                TableField = 'ImageIndex'
              end
              item
                DatasetField = 'PadreID'
                TableField = 'PadreID'
              end
              item
                DatasetField = 'Orden'
                TableField = 'Orden'
              end>
          end>
        Name = 'dbo.Opcion'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <
          item
            Name = 'OpcionID'
            DataType = datInteger
          end
          item
            Name = 'Descripcion'
            DataType = datString
            Size = 50
          end
          item
            Name = 'ImageIndex'
            DataType = datInteger
          end
          item
            Name = 'PadreID'
            DataType = datInteger
          end
          item
            Name = 'Orden'
            DataType = datInteger
          end>
      end
      item
        Params = <>
        Statements = <>
        Name = 'ObtenerLimiteAFacturar'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'NorthAmericanGreenHouse'
            ConnectionType = 'MSSQL'
            Default = True
            TargetTable = 'dbo.Empresas'
            StatementType = stAutoSQL
            ColumnMappings = <
              item
                DatasetField = 'EMPRESAID'
                TableField = 'EMPRESAID'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end
              item
                DatasetField = 'RazonSocial'
                TableField = 'RazonSocial'
              end
              item
                DatasetField = 'RFC'
                TableField = 'RFC'
              end
              item
                DatasetField = 'ClavePemex'
                TableField = 'ClavePemex'
              end
              item
                DatasetField = 'NoBombas'
                TableField = 'NoBombas'
              end
              item
                DatasetField = 'Colonia'
                TableField = 'Colonia'
              end
              item
                DatasetField = 'Ciudad'
                TableField = 'Ciudad'
              end
              item
                DatasetField = 'CodigoPostal'
                TableField = 'CodigoPostal'
              end
              item
                DatasetField = 'Host'
                TableField = 'Host'
              end
              item
                DatasetField = 'CuentaContable'
                TableField = 'CuentaContable'
              end
              item
                DatasetField = 'Impuesto'
                TableField = 'Impuesto'
              end
              item
                DatasetField = 'ClienteSagarpa'
                TableField = 'ClienteSagarpa'
              end
              item
                DatasetField = 'ClienteSagarpaPemex'
                TableField = 'ClienteSagarpaPemex'
              end
              item
                DatasetField = 'IvaRetenido'
                TableField = 'IvaRetenido'
              end
              item
                DatasetField = 'ISR'
                TableField = 'ISR'
              end>
          end>
        Name = 'dbo.Empresas'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <
          item
            Name = 'EMPRESAID'
            DataType = datInteger
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 70
          end
          item
            Name = 'RazonSocial'
            DataType = datString
            Size = 70
          end
          item
            Name = 'RFC'
            DataType = datString
            Size = 30
          end
          item
            Name = 'ClavePemex'
            DataType = datString
            Size = 10
          end
          item
            Name = 'NoBombas'
            DataType = datInteger
          end
          item
            Name = 'Colonia'
            DataType = datString
            Size = 80
          end
          item
            Name = 'Ciudad'
            DataType = datString
            Size = 30
          end
          item
            Name = 'CodigoPostal'
            DataType = datString
            Size = 10
          end
          item
            Name = 'Host'
            DataType = datString
            Size = 30
          end
          item
            Name = 'CuentaContable'
            DataType = datString
            Size = 30
          end
          item
            Name = 'Impuesto'
            DataType = datFloat
          end
          item
            Name = 'ClienteSagarpa'
            DataType = datInteger
          end
          item
            Name = 'ClienteSagarpaPemex'
            DataType = datInteger
          end
          item
            Name = 'IvaRetenido'
            DataType = datBoolean
          end
          item
            Name = 'ISR'
            DataType = datFloat
          end>
      end
      item
        Params = <
          item
            Name = 'EstacionID'
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'NorthAmericanGreenHouse'
            ConnectionType = 'MSSQL'
            Default = True
            SQL = 
              'declare @EstacionID as integer'#10#10'Select @EstacionID = (Select :Es' +
              'tacionID)'#10#10'SELECT '#10'    IDESTACION, Nombre, RazonSocial, RFC, '#10'  ' +
              '  Colonia, CodigoPostal, Host, CuentaContable, '#10'    Impuesto'#10'  F' +
              'ROM'#10'    dbo.Estacion'#10'  WHERE IDESTACION = @EstacionID'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDESTACION'
                TableField = 'IDESTACION'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end
              item
                DatasetField = 'RazonSocial'
                TableField = 'RazonSocial'
              end
              item
                DatasetField = 'RFC'
                TableField = 'RFC'
              end
              item
                DatasetField = 'Colonia'
                TableField = 'Colonia'
              end
              item
                DatasetField = 'CodigoPostal'
                TableField = 'CodigoPostal'
              end
              item
                DatasetField = 'Host'
                TableField = 'Host'
              end
              item
                DatasetField = 'CuentaContable'
                TableField = 'CuentaContable'
              end
              item
                DatasetField = 'Impuesto'
                TableField = 'Impuesto'
              end>
          end>
        Name = 'ObtenerDatosEstacion'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <
          item
            Name = 'IDESTACION'
            DataType = datInteger
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 100
          end
          item
            Name = 'RazonSocial'
            DataType = datString
            Size = 100
          end
          item
            Name = 'RFC'
            DataType = datString
            Size = 30
          end
          item
            Name = 'Colonia'
            DataType = datString
            Size = 30
          end
          item
            Name = 'CodigoPostal'
            DataType = datString
            Size = 10
          end
          item
            Name = 'Host'
            DataType = datString
            Size = 30
          end
          item
            Name = 'CuentaContable'
            DataType = datString
            Size = 20
          end
          item
            Name = 'Impuesto'
            DataType = datFloat
          end>
      end
      item
        Params = <
          item
            Name = 'EstacionID'
            DataType = datInteger
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'NorthAmericanGreenHouse'
            ConnectionType = 'MSSQL'
            Default = True
            SQL = 
              'SELECT'#10'    TipoCambioID, TipoCambio, EstacionID, Fecha'#10'FROM'#10'    ' +
              'dbo.TipoCambio'#10'where (EstacionID=:EstacionID)'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'TipoCambioID'
                TableField = 'TipoCambioID'
              end
              item
                DatasetField = 'TipoCambio'
                TableField = 'TipoCambio'
              end
              item
                DatasetField = 'EstacionID'
                TableField = 'EstacionID'
              end
              item
                DatasetField = 'Fecha'
                TableField = 'Fecha'
              end>
          end>
        Name = 'ObtenerHistorialTipoCambio'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <
          item
            Name = 'TipoCambioID'
            DataType = datInteger
          end
          item
            Name = 'TipoCambio'
            DataType = datFloat
          end
          item
            Name = 'EstacionID'
            DataType = datInteger
          end
          item
            Name = 'Fecha'
            DataType = datDateTime
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'NorthAmericanGreenHouse'
            ConnectionType = 'MSSQL'
            Default = True
            TargetTable = 'dbo.DatosSATEmpresas'
            StatementType = stAutoSQL
            ColumnMappings = <
              item
                DatasetField = 'DatosSatEmpresasID'
                TableField = 'DatosSatEmpresasID'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end
              item
                DatasetField = 'Domicilio'
                TableField = 'Domicilio'
              end
              item
                DatasetField = 'RFC'
                TableField = 'RFC'
              end
              item
                DatasetField = 'IVA'
                TableField = 'IVA'
              end
              item
                DatasetField = 'NoExterior'
                TableField = 'NoExterior'
              end
              item
                DatasetField = 'NoInterior'
                TableField = 'NoInterior'
              end
              item
                DatasetField = 'Localidad'
                TableField = 'Localidad'
              end
              item
                DatasetField = 'Municipio'
                TableField = 'Municipio'
              end
              item
                DatasetField = 'Estado'
                TableField = 'Estado'
              end
              item
                DatasetField = 'Pais'
                TableField = 'Pais'
              end
              item
                DatasetField = 'NoAprobacion'
                TableField = 'NoAprobacion'
              end
              item
                DatasetField = 'Colonia'
                TableField = 'Colonia'
              end
              item
                DatasetField = 'CodigoPostal'
                TableField = 'CodigoPostal'
              end
              item
                DatasetField = 'NoCertificado'
                TableField = 'NoCertificado'
              end
              item
                DatasetField = 'ArchivoClavePrivada'
                TableField = 'ArchivoClavePrivada'
              end
              item
                DatasetField = 'ArchivoCertificado'
                TableField = 'ArchivoCertificado'
              end
              item
                DatasetField = 'ClavePriv'
                TableField = 'ClavePriv'
              end
              item
                DatasetField = 'Certificado'
                TableField = 'Certificado'
              end
              item
                DatasetField = 'PasswordFCTElect'
                TableField = 'PasswordFCTElect'
              end
              item
                DatasetField = 'EmpresaID'
                TableField = 'EmpresaID'
              end
              item
                DatasetField = 'Sucursal'
                TableField = 'Sucursal'
              end
              item
                DatasetField = 'SucursalDE'
                TableField = 'SucursalDE'
              end
              item
                DatasetField = 'Telefono1'
                TableField = 'Telefono1'
              end
              item
                DatasetField = 'Telefono2'
                TableField = 'Telefono2'
              end
              item
                DatasetField = 'AnoAprobacion'
                TableField = 'AnoAprobacion'
              end
              item
                DatasetField = 'FolioInicial'
                TableField = 'FolioInicial'
              end
              item
                DatasetField = 'FolioFinal'
                TableField = 'FolioFinal'
              end>
          end>
        Name = 'dbo.DatosSATEmpresas'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <
          item
            Name = 'DatosSatEmpresasID'
            DataType = datInteger
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 70
          end
          item
            Name = 'Domicilio'
            DataType = datString
            Size = 100
          end
          item
            Name = 'RFC'
            DataType = datString
            Size = 20
          end
          item
            Name = 'IVA'
            DataType = datFloat
          end
          item
            Name = 'NoExterior'
            DataType = datString
            Size = 20
          end
          item
            Name = 'NoInterior'
            DataType = datString
            Size = 20
          end
          item
            Name = 'Localidad'
            DataType = datString
            Size = 50
          end
          item
            Name = 'Municipio'
            DataType = datString
            Size = 50
          end
          item
            Name = 'Estado'
            DataType = datString
            Size = 50
          end
          item
            Name = 'Pais'
            DataType = datString
            Size = 50
          end
          item
            Name = 'NoAprobacion'
            DataType = datInteger
          end
          item
            Name = 'Colonia'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CodigoPostal'
            DataType = datString
            Size = 50
          end
          item
            Name = 'NoCertificado'
            DataType = datString
            Size = 50
          end
          item
            Name = 'ArchivoClavePrivada'
            DataType = datString
            Size = 200
          end
          item
            Name = 'ArchivoCertificado'
            DataType = datString
            Size = 200
          end
          item
            Name = 'ClavePriv'
            DataType = datString
            Size = 200
          end
          item
            Name = 'Certificado'
            DataType = datString
            Size = 4000
          end
          item
            Name = 'PasswordFCTElect'
            DataType = datString
            Size = 200
          end
          item
            Name = 'EmpresaID'
            DataType = datInteger
          end
          item
            Name = 'Sucursal'
            DataType = datInteger
          end
          item
            Name = 'SucursalDE'
            DataType = datInteger
          end
          item
            Name = 'Telefono1'
            DataType = datString
            Size = 50
          end
          item
            Name = 'Telefono2'
            DataType = datString
            Size = 50
          end
          item
            Name = 'AnoAprobacion'
            DataType = datDateTime
          end
          item
            Name = 'FolioInicial'
            DataType = datInteger
          end
          item
            Name = 'FolioFinal'
            DataType = datInteger
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'NorthAmericanGreenHouse'
            ConnectionType = 'MSSQL'
            Default = True
            TargetTable = 'dbo.Reporte'
            StatementType = stAutoSQL
            ColumnMappings = <
              item
                DatasetField = 'ReporteID'
                TableField = 'ReporteID'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end
              item
                DatasetField = 'Tipo'
                TableField = 'Tipo'
              end
              item
                DatasetField = 'Parametros'
                TableField = 'Parametros'
              end
              item
                DatasetField = 'Template'
                TableField = 'Template'
              end
              item
                DatasetField = 'TemplateMedia'
                TableField = 'TemplateMedia'
              end
              item
                DatasetField = 'TemplateBaja'
                TableField = 'TemplateBaja'
              end
              item
                DatasetField = 'TemplateExportar'
                TableField = 'TemplateExportar'
              end
              item
                DatasetField = 'SQL1'
                TableField = 'SQL1'
              end
              item
                DatasetField = 'SQL2'
                TableField = 'SQL2'
              end
              item
                DatasetField = 'CampoJoin'
                TableField = 'CampoJoin'
              end
              item
                DatasetField = 'USUARIOS'
                TableField = 'USUARIOS'
              end>
          end>
        Name = 'dbo.Reporte'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <
          item
            Name = 'ReporteID'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 50
            Required = True
          end
          item
            Name = 'Tipo'
            DataType = datInteger
          end
          item
            Name = 'Parametros'
            DataType = datString
            Size = 50
          end
          item
            Name = 'Template'
            DataType = datMemo
          end
          item
            Name = 'TemplateMedia'
            DataType = datMemo
          end
          item
            Name = 'TemplateBaja'
            DataType = datMemo
          end
          item
            Name = 'TemplateExportar'
            DataType = datMemo
          end
          item
            Name = 'SQL1'
            DataType = datMemo
          end
          item
            Name = 'SQL2'
            DataType = datMemo
          end
          item
            Name = 'CampoJoin'
            DataType = datString
            Size = 20
          end
          item
            Name = 'USUARIOS'
            DataType = datString
            Size = 1000
          end>
      end
      item
        Params = <
          item
            Name = 'Tipo'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'USUARIOS'
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'NorthAmericanGreenHouse'
            ConnectionType = 'MSSQL'
            Default = True
            SQL = 
              'Select ReporteID,Nombre,Tipo,Parametros,'#10'       Template,SQL1,SQ' +
              'L2,CampoJoin'#10'From Reporte'#10'Where  Tipo = :Tipo AND'#10'USUARIOS LIKE ' +
              ' '#39'%'#39'+ :USUARIOS +'#39'%'#39#10'order by Nombre'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'ReporteID'
                TableField = 'ReporteID'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end
              item
                DatasetField = 'Tipo'
                TableField = 'Tipo'
              end
              item
                DatasetField = 'Parametros'
                TableField = 'Parametros'
              end
              item
                DatasetField = 'Template'
                TableField = 'Template'
              end
              item
                DatasetField = 'SQL1'
                TableField = 'SQL1'
              end
              item
                DatasetField = 'SQL2'
                TableField = 'SQL2'
              end
              item
                DatasetField = 'CampoJoin'
                TableField = 'CampoJoin'
              end>
          end>
        Name = 'Reportes'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <
          item
            Name = 'ReporteID'
            DataType = datInteger
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 50
          end
          item
            Name = 'Tipo'
            DataType = datInteger
          end
          item
            Name = 'Parametros'
            DataType = datString
            Size = 50
          end
          item
            Name = 'Template'
            DataType = datMemo
          end
          item
            Name = 'SQL1'
            DataType = datMemo
          end
          item
            Name = 'SQL2'
            DataType = datMemo
          end
          item
            Name = 'CampoJoin'
            DataType = datString
            Size = 20
          end>
      end
      item
        Params = <
          item
            Name = 'Campo'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'Serie'
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'NorthAmericanGreenHouse'
            ConnectionType = 'MSSQL'
            Default = True
            TargetTable = 'dbo.Folio'
            SQL = 
              'declare @Campo as varchar(50)'#10'declare @Serie as varchar(10)'#10#10'sel' +
              'ect @Campo = (Select :Campo)'#10'select @Serie = (Select :Serie)'#10#10'se' +
              'lect Folio from folio'#10'where campo = @campo and serie = @serie'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'Folio'
                TableField = 'Folio'
              end>
          end>
        Name = 'spFolioActual'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <
          item
            Name = 'Folio'
            DataType = datInteger
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'NorthAmericanGreenHouse'
            ConnectionType = 'MSSQL'
            Default = True
            TargetTable = 'dbo.ESTACION'
            StatementType = stAutoSQL
            ColumnMappings = <
              item
                DatasetField = 'IDESTACION'
                TableField = 'IDESTACION'
              end
              item
                DatasetField = 'NOMBRE'
                TableField = 'NOMBRE'
              end
              item
                DatasetField = 'RAZONSOCIAL'
                TableField = 'RAZONSOCIAL'
              end
              item
                DatasetField = 'RFC'
                TableField = 'RFC'
              end
              item
                DatasetField = 'HOST'
                TableField = 'HOST'
              end
              item
                DatasetField = 'CUENTACONTABLE'
                TableField = 'CUENTACONTABLE'
              end
              item
                DatasetField = 'IMPUESTO'
                TableField = 'IMPUESTO'
              end
              item
                DatasetField = 'CALLE'
                TableField = 'CALLE'
              end
              item
                DatasetField = 'COLONIA'
                TableField = 'COLONIA'
              end
              item
                DatasetField = 'NOEXTERIOR'
                TableField = 'NOEXTERIOR'
              end
              item
                DatasetField = 'NOINTERIOR'
                TableField = 'NOINTERIOR'
              end
              item
                DatasetField = 'CODIGOPOSTAL'
                TableField = 'CODIGOPOSTAL'
              end
              item
                DatasetField = 'MUNICIPIO'
                TableField = 'MUNICIPIO'
              end
              item
                DatasetField = 'LOCALIDAD'
                TableField = 'LOCALIDAD'
              end
              item
                DatasetField = 'ESTADO'
                TableField = 'ESTADO'
              end
              item
                DatasetField = 'EXCALLE'
                TableField = 'EXCALLE'
              end
              item
                DatasetField = 'EXCOLONIA'
                TableField = 'EXCOLONIA'
              end
              item
                DatasetField = 'EXNOEXTERIOR'
                TableField = 'EXNOEXTERIOR'
              end
              item
                DatasetField = 'EXNOINTERIOR'
                TableField = 'EXNOINTERIOR'
              end
              item
                DatasetField = 'EXCODIGOPOSTAL'
                TableField = 'EXCODIGOPOSTAL'
              end
              item
                DatasetField = 'EXMUNICIPIO'
                TableField = 'EXMUNICIPIO'
              end
              item
                DatasetField = 'EXLOCALIDAD'
                TableField = 'EXLOCALIDAD'
              end
              item
                DatasetField = 'EXESTADO'
                TableField = 'EXESTADO'
              end
              item
                DatasetField = 'NOAPROBACION'
                TableField = 'NOAPROBACION'
              end
              item
                DatasetField = 'FECHAAPROBACION'
                TableField = 'FECHAAPROBACION'
              end
              item
                DatasetField = 'NOAPROBACIONES'
                TableField = 'NOAPROBACIONES'
              end
              item
                DatasetField = 'VERSIONCFD'
                TableField = 'VERSIONCFD'
              end
              item
                DatasetField = 'REGIMENFISCAL'
                TableField = 'REGIMENFISCAL'
              end
              item
                DatasetField = 'CODIGOFACTURA'
                TableField = 'CODIGOFACTURA'
              end
              item
                DatasetField = 'FORMATOFACTURAWEB'
                TableField = 'FORMATOFACTURAWEB'
              end
              item
                DatasetField = 'SERIEENLINEA'
                TableField = 'SERIEENLINEA'
              end
              item
                DatasetField = 'TELEFONO'
                TableField = 'TELEFONO'
              end
              item
                DatasetField = 'IDESTACIONBANCARIA'
                TableField = 'IDESTACIONBANCARIA'
              end
              item
                DatasetField = 'SERIEBANCARIA'
                TableField = 'SERIEBANCARIA'
              end
              item
                DatasetField = 'LOGOESTACION'
                TableField = 'LOGOESTACION'
              end
              item
                DatasetField = 'PAIS'
                TableField = 'PAIS'
              end
              item
                DatasetField = 'EXPAIS'
                TableField = 'EXPAIS'
              end
              item
                DatasetField = 'EXREFERENCIA'
                TableField = 'EXREFERENCIA'
              end>
          end>
        Name = 'dbo.ESTACION'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
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
      end
      item
        Params = <
          item
            Name = 'Campo'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'Serie'
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'NorthAmericanGreenHouse'
            ConnectionType = 'MSSQL'
            Default = True
            TargetTable = 'dbo.Folio'
            SQL = 
              'DECLARE @Campo AS VARCHAR(30)'#10'DECLARE @Serie AS VARCHAR(20)'#10#10'SEL' +
              'ECT @Campo = :Campo'#10'SELECT @Serie = :Serie'#10#10'SELECT Folio'#10'FROM Fo' +
              'lio'#10'WHERE (UPPER(Campo) = UPPER(@Campo)) AND (UPPER(Serie) = UPP' +
              'ER(@Serie))'#10#10'UPDATE Folio'#10'SET Folio = Folio + 1'#10'WHERE (UPPER(Cam' +
              'po) = UPPER(@Campo)) AND (UPPER(Serie) = UPPER(@Serie))'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'Folio'
                TableField = 'Folio'
              end>
          end>
        Name = 'spFolio'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <
          item
            Name = 'Folio'
            DataType = datInteger
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'NorthAmericanGreenHouse'
            ConnectionType = 'MSSQL'
            Default = True
            TargetTable = 'dbo.BITACORAESTACION'
            SQL = 
              'SELECT '#9#10#9'"BITACORAID", "USUARIOID", "FECHA", '#10#9'"NOTA", "ACTIVID' +
              'AD", "FRECUENCIA", '#10#9'"OBSERVACIONES", "ESTACIONID", "FIRMA", '#10#9'"' +
              'FECHAHORA", "FOLIO", "FOTO1" '#10'FROM '#10#9'"dbo"."BITACORAESTACION" '#10'W' +
              'HERE '#10#9'BITACORAID = -1'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'BITACORAID'
                TableField = 'BITACORAID'
              end
              item
                DatasetField = 'USUARIOID'
                TableField = 'USUARIOID'
              end
              item
                DatasetField = 'FECHA'
                TableField = 'FECHA'
              end
              item
                DatasetField = 'NOTA'
                TableField = 'NOTA'
              end
              item
                DatasetField = 'ACTIVIDAD'
                TableField = 'ACTIVIDAD'
              end
              item
                DatasetField = 'FRECUENCIA'
                TableField = 'FRECUENCIA'
              end
              item
                DatasetField = 'OBSERVACIONES'
                TableField = 'OBSERVACIONES'
              end
              item
                DatasetField = 'ESTACIONID'
                TableField = 'ESTACIONID'
              end
              item
                DatasetField = 'FIRMA'
                TableField = 'FIRMA'
              end
              item
                DatasetField = 'FECHAHORA'
                TableField = 'FECHAHORA'
              end
              item
                DatasetField = 'FOLIO'
                TableField = 'FOLIO'
              end
              item
                DatasetField = 'FOTO1'
                TableField = 'FOTO1'
              end>
          end>
        Name = 'dbo.BITACORAESTACION'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <
          item
            Name = 'BITACORAID'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'USUARIOID'
            DataType = datInteger
          end
          item
            Name = 'FECHA'
            DataType = datDateTime
          end
          item
            Name = 'NOTA'
            DataType = datString
            Size = 200
          end
          item
            Name = 'ACTIVIDAD'
            DataType = datString
            Size = 1000
          end
          item
            Name = 'FRECUENCIA'
            DataType = datString
            Size = 1000
          end
          item
            Name = 'OBSERVACIONES'
            DataType = datString
            Size = 1000
          end
          item
            Name = 'ESTACIONID'
            DataType = datInteger
          end
          item
            Name = 'FIRMA'
            DataType = datBlob
          end
          item
            Name = 'FECHAHORA'
            DataType = datDateTime
          end
          item
            Name = 'FOLIO'
            DataType = datInteger
          end
          item
            Name = 'FOTO1'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'FIRMADEFAULT'
            DataType = datBlob
            BlobType = dabtBlob
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'UsuarioID'
            DataType = datInteger
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'NorthAmericanGreenHouse'
            ConnectionType = 'MSSQL'
            Default = True
            TargetTable = 'dbo.USUARIO'
            SQL = 
              'UPDATE USUARIO'#10'set FIRMADEFAULT = :FIRMADEFAULT,'#10'    CODIGO = '#39'P' +
              'ETER'#39#10'where USUARIO.IDEMPLEADO = :UsuarioID'
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spActualizaFirmaDefault'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <>
      end
      item
        Params = <
          item
            Name = 'USUARIOID'
            DataType = datInteger
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'NorthAmericanGreenHouse'
            ConnectionType = 'MSSQL'
            Default = True
            TargetTable = 'dbo.USUARIO'
            SQL = 
              'SELECT '#9#10#9'"IDEMPLEADO", "CODIGO", "NOMBRE", '#10#9'"USERNAME", "USERP' +
              'ASSWORD", "FIRMADEFAULT" '#10'FROM '#10#9'"dbo"."USUARIO" '#10'WHERE '#10#9'IDEMPL' +
              'EADO = :USUARIOID'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDEMPLEADO'
                TableField = 'IDEMPLEADO'
              end
              item
                DatasetField = 'CODIGO'
                TableField = 'CODIGO'
              end
              item
                DatasetField = 'NOMBRE'
                TableField = 'NOMBRE'
              end
              item
                DatasetField = 'USERNAME'
                TableField = 'USERNAME'
              end
              item
                DatasetField = 'USERPASSWORD'
                TableField = 'USERPASSWORD'
              end
              item
                DatasetField = 'FIRMADEFAULT'
                TableField = 'FIRMADEFAULT'
              end>
          end>
        Name = 'dbo.USUARIO'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <
          item
            Name = 'IDEMPLEADO'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'CODIGO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'NOMBRE'
            DataType = datString
            Size = 70
          end
          item
            Name = 'USERNAME'
            DataType = datString
            Size = 10
            Required = True
          end
          item
            Name = 'USERPASSWORD'
            DataType = datString
            Size = 10
            Required = True
          end
          item
            Name = 'FIRMADEFAULT'
            DataType = datBlob
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'NorthAmericanGreenHouse'
            ConnectionType = 'MSSQL'
            Default = True
            TargetTable = 'dbo.EMPLEADO'
            StatementType = stAutoSQL
            ColumnMappings = <
              item
                DatasetField = 'IDEMPLEADO'
                TableField = 'IDEMPLEADO'
              end
              item
                DatasetField = 'NOMBRE'
                TableField = 'NOMBRE'
              end
              item
                DatasetField = 'CODIGOEMPLEADO'
                TableField = 'CODIGOEMPLEADO'
              end
              item
                DatasetField = 'DOMICILIO'
                TableField = 'DOMICILIO'
              end
              item
                DatasetField = 'CIUDAD'
                TableField = 'CIUDAD'
              end
              item
                DatasetField = 'TELEFONO'
                TableField = 'TELEFONO'
              end
              item
                DatasetField = 'CUENTACONTABLE'
                TableField = 'CUENTACONTABLE'
              end
              item
                DatasetField = 'FECHAALTA'
                TableField = 'FECHAALTA'
              end
              item
                DatasetField = 'FECHABAJA'
                TableField = 'FECHABAJA'
              end
              item
                DatasetField = 'IMSS'
                TableField = 'IMSS'
              end
              item
                DatasetField = 'STATUS'
                TableField = 'STATUS'
              end
              item
                DatasetField = 'FOTOEMPLEADO'
                TableField = 'FOTOEMPLEADO'
              end
              item
                DatasetField = 'IDESTACION'
                TableField = 'IDESTACION'
              end
              item
                DatasetField = 'TURNO'
                TableField = 'TURNO'
              end
              item
                DatasetField = 'FOTOEMPLEADO1'
                TableField = 'FOTOEMPLEADO1'
              end
              item
                DatasetField = 'FOTOEMPLEADO2'
                TableField = 'FOTOEMPLEADO2'
              end
              item
                DatasetField = 'FOTOEMPLEADO3'
                TableField = 'FOTOEMPLEADO3'
              end
              item
                DatasetField = 'FOTOEMPLEADO4'
                TableField = 'FOTOEMPLEADO4'
              end
              item
                DatasetField = 'FOTOEMPLEADO5'
                TableField = 'FOTOEMPLEADO5'
              end
              item
                DatasetField = 'FOTOEMPLEADO6'
                TableField = 'FOTOEMPLEADO6'
              end
              item
                DatasetField = 'FOTOEMPLEADO7'
                TableField = 'FOTOEMPLEADO7'
              end
              item
                DatasetField = 'FOTOEMPLEADO8'
                TableField = 'FOTOEMPLEADO8'
              end
              item
                DatasetField = 'FOTOEMPLEADO9'
                TableField = 'FOTOEMPLEADO9'
              end
              item
                DatasetField = 'FOTOEMPLEADO10'
                TableField = 'FOTOEMPLEADO10'
              end>
          end>
        Name = 'dbo.EMPLEADO'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <
          item
            Name = 'IDEMPLEADO'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'NOMBRE'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CODIGOEMPLEADO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'DOMICILIO'
            DataType = datString
            Size = 100
          end
          item
            Name = 'CIUDAD'
            DataType = datString
            Size = 100
          end
          item
            Name = 'TELEFONO'
            DataType = datString
            Size = 20
          end
          item
            Name = 'CUENTACONTABLE'
            DataType = datString
            Size = 20
          end
          item
            Name = 'FECHAALTA'
            DataType = datDateTime
          end
          item
            Name = 'FECHABAJA'
            DataType = datDateTime
          end
          item
            Name = 'IMSS'
            DataType = datString
            Size = 150
          end
          item
            Name = 'STATUS'
            DataType = datBoolean
          end
          item
            Name = 'FOTOEMPLEADO'
            DataType = datBlob
          end
          item
            Name = 'IDESTACION'
            DataType = datInteger
          end
          item
            Name = 'TURNO'
            DataType = datInteger
          end
          item
            Name = 'FOTOEMPLEADO1'
            DataType = datBlob
          end
          item
            Name = 'FOTOEMPLEADO2'
            DataType = datBlob
          end
          item
            Name = 'FOTOEMPLEADO3'
            DataType = datBlob
          end
          item
            Name = 'FOTOEMPLEADO4'
            DataType = datBlob
          end
          item
            Name = 'FOTOEMPLEADO5'
            DataType = datBlob
          end
          item
            Name = 'FOTOEMPLEADO6'
            DataType = datBlob
          end
          item
            Name = 'FOTOEMPLEADO7'
            DataType = datBlob
          end
          item
            Name = 'FOTOEMPLEADO8'
            DataType = datBlob
          end
          item
            Name = 'FOTOEMPLEADO9'
            DataType = datBlob
          end
          item
            Name = 'FOTOEMPLEADO10'
            DataType = datBlob
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'NorthAmericanGreenHouse'
            ConnectionType = 'MSSQL'
            Default = True
            TargetTable = 'dbo.HORARIOEMPLEADO'
            StatementType = stAutoSQL
            ColumnMappings = <
              item
                DatasetField = 'IDHORARIO'
                TableField = 'IDHORARIO'
              end
              item
                DatasetField = 'IDEMPLEADO'
                TableField = 'IDEMPLEADO'
              end
              item
                DatasetField = 'FECHAALTA'
                TableField = 'FECHAALTA'
              end
              item
                DatasetField = 'HORAINICIO'
                TableField = 'HORAINICIO'
              end
              item
                DatasetField = 'HORAFINAL'
                TableField = 'HORAFINAL'
              end
              item
                DatasetField = 'REFERENCIA'
                TableField = 'REFERENCIA'
              end
              item
                DatasetField = 'NOMBREEMPLEADO'
                TableField = 'NOMBREEMPLEADO'
              end
              item
                DatasetField = 'IDESTACION'
                TableField = 'IDESTACION'
              end>
          end>
        Name = 'dbo.HORARIOEMPLEADO'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <
          item
            Name = 'IDHORARIO'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'IDEMPLEADO'
            DataType = datInteger
          end
          item
            Name = 'FECHAALTA'
            DataType = datDateTime
          end
          item
            Name = 'HORAINICIO'
            DataType = datDateTime
          end
          item
            Name = 'HORAFINAL'
            DataType = datDateTime
          end
          item
            Name = 'REFERENCIA'
            DataType = datString
            Size = 100
          end
          item
            Name = 'NOMBREEMPLEADO'
            DataType = datString
            Size = 150
          end
          item
            Name = 'IDESTACION'
            DataType = datInteger
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'NorthAmericanGreenHouse'
            ConnectionType = 'MSSQL'
            Default = True
            TargetTable = 'dbo.PROGRAMAMANTENIMIENTO'
            StatementType = stAutoSQL
            ColumnMappings = <
              item
                DatasetField = 'IDPROGRAMAMANTENIMIENTO'
                TableField = 'IDPROGRAMAMANTENIMIENTO'
              end
              item
                DatasetField = 'CODIGO'
                TableField = 'CODIGO'
              end
              item
                DatasetField = 'CONCEPTO'
                TableField = 'CONCEPTO'
              end
              item
                DatasetField = 'IDTIPOMOVIMIENTO'
                TableField = 'IDTIPOMOVIMIENTO'
              end
              item
                DatasetField = 'FECHAMANTENIMIENTO'
                TableField = 'FECHAMANTENIMIENTO'
              end
              item
                DatasetField = 'PERIODICIDAD'
                TableField = 'PERIODICIDAD'
              end
              item
                DatasetField = 'IDESTACION'
                TableField = 'IDESTACION'
              end>
          end>
        Name = 'dbo.PROGRAMAMANTENIMIENTO'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <
          item
            Name = 'IDPROGRAMAMANTENIMIENTO'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'CODIGO'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CONCEPTO'
            DataType = datString
            Size = 500
          end
          item
            Name = 'IDTIPOMOVIMIENTO'
            DataType = datInteger
          end
          item
            Name = 'FECHAMANTENIMIENTO'
            DataType = datDateTime
          end
          item
            Name = 'PERIODICIDAD'
            DataType = datString
            Size = 50
          end
          item
            Name = 'IDESTACION'
            DataType = datInteger
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'NorthAmericanGreenHouse'
            ConnectionType = 'MSSQL'
            Default = True
            TargetTable = 'dbo.TIPOMANTENIMIENTO'
            StatementType = stAutoSQL
            ColumnMappings = <
              item
                DatasetField = 'IDTIPOMANTENIMIENTO'
                TableField = 'IDTIPOMANTENIMIENTO'
              end
              item
                DatasetField = 'CONCEPTO'
                TableField = 'CONCEPTO'
              end>
          end>
        Name = 'dbo.TIPOMANTENIMIENTO'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <
          item
            Name = 'IDTIPOMANTENIMIENTO'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'CONCEPTO'
            DataType = datString
            Size = 100
          end>
      end
      item
        Params = <
          item
            Name = 'TIPO'
            DataType = datMemo
            Value = '5'
            ParamType = daptInput
          end
          item
            Name = 'IDESTACION'
            DataType = datMemo
            Value = '2601'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'NorthAmericanGreenHouse'
            ConnectionType = 'MSSQL'
            Default = True
            SQL = 
              'DECLARE @XML VARCHAR(MAX)'#10'DECLARE @IDESTACION INT'#10'DECLARE @TIPO ' +
              'INT'#10'DECLARE @COUNT INT'#10#10'SET @TIPO = :TIPO'#10'SET @IDESTACION = :IDE' +
              'STACION'#10#10#10'IF @TIPO = 1'#10'BEGIN'#10'SET @COUNT = (SELECT COUNT(PROGRAMA' +
              'MANTENIMIENTO.IDPROGRAMAMANTENIMIENTO) FROM PROGRAMAMANTENIMIENT' +
              'O'#10'INNER JOIN MANTENIMIENTOACTIVIDAD ON MANTENIMIENTOACTIVIDAD.ID' +
              'PROGRAMAMANTENIMIENTO = PROGRAMAMANTENIMIENTO.IDPROGRAMAMANTENIM' +
              'IENTO'#10'INNER JOIN TIPOMANTENIMIENTO ON TIPOMANTENIMIENTO.IDTIPOMA' +
              'NTENIMIENTO = PROGRAMAMANTENIMIENTO.IDTIPOMOVIMIENTO'#10'WHERE PROGR' +
              'AMAMANTENIMIENTO.IDESTACION = @IDESTACION AND MANTENIMIENTOACTIV' +
              'IDAD.STATUS= '#39'PENDIENTE'#39')'#10'SET @XML ='#10'(SELECT TOP 50 MANTENIMIENT' +
              'OACTIVIDAD.IDMANTENIMIENTOACTIVIDAD, PROGRAMAMANTENIMIENTO.CODIG' +
              'O, PROGRAMAMANTENIMIENTO.CONCEPTO, TIPOMANTENIMIENTO.CONCEPTO TI' +
              'POMANTO,'#10'       MANTENIMIENTOACTIVIDAD.FECHAAREALIZARMANTENIMIEN' +
              'TO, MANTENIMIENTOACTIVIDAD.STATUS FROM PROGRAMAMANTENIMIENTO'#10'INN' +
              'ER JOIN MANTENIMIENTOACTIVIDAD ON MANTENIMIENTOACTIVIDAD.IDPROGR' +
              'AMAMANTENIMIENTO = PROGRAMAMANTENIMIENTO.IDPROGRAMAMANTENIMIENTO' +
              #10'INNER JOIN TIPOMANTENIMIENTO ON TIPOMANTENIMIENTO.IDTIPOMANTENI' +
              'MIENTO = PROGRAMAMANTENIMIENTO.IDTIPOMOVIMIENTO'#10'WHERE PROGRAMAMA' +
              'NTENIMIENTO.IDESTACION = @IDESTACION AND MANTENIMIENTOACTIVIDAD.' +
              'STATUS= '#39'PENDIENTE'#39' ORDER BY MANTENIMIENTOACTIVIDAD.FECHAAREALIZ' +
              'ARMANTENIMIENTO ASC'#10'FOR XML RAW ('#39'SERVICES'#39'), ELEMENTS)'#10'END'#10#10'IF ' +
              '@TIPO = 2'#10'BEGIN'#10'SET @COUNT = (5)'#10'SET @XML ='#10'(SELECT TOP 5 MANTEN' +
              'IMIENTOACTIVIDAD.IDMANTENIMIENTOACTIVIDAD, PROGRAMAMANTENIMIENTO' +
              '.CODIGO, PROGRAMAMANTENIMIENTO.CONCEPTO, TIPOMANTENIMIENTO.CONCE' +
              'PTO TIPOMANTO,'#10'       MANTENIMIENTOACTIVIDAD.FECHAAREALIZARMANTE' +
              'NIMIENTO, MANTENIMIENTOACTIVIDAD.STATUS FROM PROGRAMAMANTENIMIEN' +
              'TO'#10'INNER JOIN MANTENIMIENTOACTIVIDAD ON MANTENIMIENTOACTIVIDAD.I' +
              'DPROGRAMAMANTENIMIENTO = PROGRAMAMANTENIMIENTO.IDPROGRAMAMANTENI' +
              'MIENTO'#10'INNER JOIN TIPOMANTENIMIENTO ON TIPOMANTENIMIENTO.IDTIPOM' +
              'ANTENIMIENTO = PROGRAMAMANTENIMIENTO.IDTIPOMOVIMIENTO'#10'WHERE PROG' +
              'RAMAMANTENIMIENTO.IDESTACION = @IDESTACION AND MANTENIMIENTOACTI' +
              'VIDAD.STATUS= '#39'PENDIENTE'#39' ORDER BY MANTENIMIENTOACTIVIDAD.FECHAA' +
              'REALIZARMANTENIMIENTO ASC'#10'FOR XML RAW ('#39'SERVICES'#39'), ELEMENTS)'#10'EN' +
              'D'#10#10'IF @TIPO = 3'#10'BEGIN'#10'SET @COUNT = (SELECT COUNT(PROGRAMAMANTENI' +
              'MIENTO.IDPROGRAMAMANTENIMIENTO) FROM PROGRAMAMANTENIMIENTO'#10'INNER' +
              ' JOIN MANTENIMIENTOACTIVIDAD ON MANTENIMIENTOACTIVIDAD.IDPROGRAM' +
              'AMANTENIMIENTO = PROGRAMAMANTENIMIENTO.IDPROGRAMAMANTENIMIENTO'#10'I' +
              'NNER JOIN TIPOMANTENIMIENTO ON TIPOMANTENIMIENTO.IDTIPOMANTENIMI' +
              'ENTO = PROGRAMAMANTENIMIENTO.IDTIPOMOVIMIENTO'#10'WHERE PROGRAMAMANT' +
              'ENIMIENTO.IDESTACION = @IDESTACION AND MANTENIMIENTOACTIVIDAD.ST' +
              'ATUS= '#39'PENDIENTE'#39' AND MONTH(MANTENIMIENTOACTIVIDAD.FECHAAREALIZA' +
              'RMANTENIMIENTO) = MONTH(GETDATE())'#10'                             ' +
              '                        AND DAY(MANTENIMIENTOACTIVIDAD.FECHAAREA' +
              'LIZARMANTENIMIENTO) = DAY(GETDATE())'#10#9#9#9#9#9#9#9#9#9#9#9#9#9' AND YEAR(MANT' +
              'ENIMIENTOACTIVIDAD.FECHAAREALIZARMANTENIMIENTO) = YEAR(GETDATE()' +
              '))'#10'SET @XML ='#10'(SELECT MANTENIMIENTOACTIVIDAD.IDMANTENIMIENTOACTI' +
              'VIDAD, PROGRAMAMANTENIMIENTO.CODIGO, PROGRAMAMANTENIMIENTO.CONCE' +
              'PTO, TIPOMANTENIMIENTO.CONCEPTO TIPOMANTO,'#10'       MANTENIMIENTOA' +
              'CTIVIDAD.FECHAAREALIZARMANTENIMIENTO, MANTENIMIENTOACTIVIDAD.STA' +
              'TUS FROM PROGRAMAMANTENIMIENTO'#10'INNER JOIN MANTENIMIENTOACTIVIDAD' +
              ' ON MANTENIMIENTOACTIVIDAD.IDPROGRAMAMANTENIMIENTO = PROGRAMAMAN' +
              'TENIMIENTO.IDPROGRAMAMANTENIMIENTO'#10'INNER JOIN TIPOMANTENIMIENTO ' +
              'ON TIPOMANTENIMIENTO.IDTIPOMANTENIMIENTO = PROGRAMAMANTENIMIENTO' +
              '.IDTIPOMOVIMIENTO'#10'WHERE PROGRAMAMANTENIMIENTO.IDESTACION = @IDES' +
              'TACION AND MANTENIMIENTOACTIVIDAD.STATUS= '#39'PENDIENTE'#39' AND MONTH(' +
              'MANTENIMIENTOACTIVIDAD.FECHAAREALIZARMANTENIMIENTO) = MONTH(GETD' +
              'ATE())'#10'                                                     AND ' +
              'DAY(MANTENIMIENTOACTIVIDAD.FECHAAREALIZARMANTENIMIENTO) = DAY(GE' +
              'TDATE())'#10#9#9#9#9#9#9#9#9#9#9#9#9#9' AND YEAR(MANTENIMIENTOACTIVIDAD.FECHAAREA' +
              'LIZARMANTENIMIENTO) = YEAR(GETDATE()) ORDER BY MANTENIMIENTOACTI' +
              'VIDAD.FECHAAREALIZARMANTENIMIENTO ASC'#10'FOR XML RAW ('#39'SERVICES'#39'), ' +
              'ELEMENTS)'#10'END'#10#10'IF @TIPO = 4'#10'BEGIN'#10'SET @COUNT = (SELECT COUNT(PRO' +
              'GRAMAMANTENIMIENTO.IDPROGRAMAMANTENIMIENTO) FROM PROGRAMAMANTENI' +
              'MIENTO'#10'INNER JOIN MANTENIMIENTOACTIVIDAD ON MANTENIMIENTOACTIVID' +
              'AD.IDPROGRAMAMANTENIMIENTO = PROGRAMAMANTENIMIENTO.IDPROGRAMAMAN' +
              'TENIMIENTO'#10'INNER JOIN TIPOMANTENIMIENTO ON TIPOMANTENIMIENTO.IDT' +
              'IPOMANTENIMIENTO = PROGRAMAMANTENIMIENTO.IDTIPOMOVIMIENTO'#10'WHERE ' +
              'PROGRAMAMANTENIMIENTO.IDESTACION = @IDESTACION AND MANTENIMIENTO' +
              'ACTIVIDAD.STATUS<> '#39'PENDIENTE'#39')'#10#10'SET @XML ='#10'(SELECT MANTENIMIENT' +
              'OACTIVIDAD.IDMANTENIMIENTOACTIVIDAD, PROGRAMAMANTENIMIENTO.CODIG' +
              'O, PROGRAMAMANTENIMIENTO.CONCEPTO, TIPOMANTENIMIENTO.CONCEPTO TI' +
              'POMANTO,'#10'       MANTENIMIENTOACTIVIDAD.FECHAAREALIZARMANTENIMIEN' +
              'TO, MANTENIMIENTOACTIVIDAD.STATUS FROM PROGRAMAMANTENIMIENTO'#10'INN' +
              'ER JOIN MANTENIMIENTOACTIVIDAD ON MANTENIMIENTOACTIVIDAD.IDPROGR' +
              'AMAMANTENIMIENTO = PROGRAMAMANTENIMIENTO.IDPROGRAMAMANTENIMIENTO' +
              #10'INNER JOIN TIPOMANTENIMIENTO ON TIPOMANTENIMIENTO.IDTIPOMANTENI' +
              'MIENTO = PROGRAMAMANTENIMIENTO.IDTIPOMOVIMIENTO'#10'WHERE PROGRAMAMA' +
              'NTENIMIENTO.IDESTACION = @IDESTACION AND MANTENIMIENTOACTIVIDAD.' +
              'STATUS<> '#39'PENDIENTE'#39' ORDER BY MANTENIMIENTOACTIVIDAD.FECHAAREALI' +
              'ZARMANTENIMIENTO ASC'#10'FOR XML RAW ('#39'SERVICES'#39'), ELEMENTS)'#10'END'#10#10'IF' +
              ' @TIPO = 5'#10'BEGIN'#10'SET @COUNT = (SELECT COUNT(PROGRAMAMANTENIMIENT' +
              'O.IDPROGRAMAMANTENIMIENTO) FROM PROGRAMAMANTENIMIENTO'#10'INNER JOIN' +
              ' MANTENIMIENTOACTIVIDAD ON MANTENIMIENTOACTIVIDAD.IDPROGRAMAMANT' +
              'ENIMIENTO = PROGRAMAMANTENIMIENTO.IDPROGRAMAMANTENIMIENTO'#10'INNER ' +
              'JOIN TIPOMANTENIMIENTO ON TIPOMANTENIMIENTO.IDTIPOMANTENIMIENTO ' +
              '= PROGRAMAMANTENIMIENTO.IDTIPOMOVIMIENTO'#10'WHERE PROGRAMAMANTENIMI' +
              'ENTO.IDESTACION = @IDESTACION AND MANTENIMIENTOACTIVIDAD.STATUS=' +
              ' '#39'PENDIENTE'#39' AND CAST(MANTENIMIENTOACTIVIDAD.FECHAAREALIZARMANTE' +
              'NIMIENTO AS DATE) <= CAST(GETDATE() AS DATE))'#10#10'SET @XML ='#10'(SELEC' +
              'T MANTENIMIENTOACTIVIDAD.IDMANTENIMIENTOACTIVIDAD, PROGRAMAMANTE' +
              'NIMIENTO.CODIGO, PROGRAMAMANTENIMIENTO.CONCEPTO, TIPOMANTENIMIEN' +
              'TO.CONCEPTO TIPOMANTO,'#10'       MANTENIMIENTOACTIVIDAD.FECHAAREALI' +
              'ZARMANTENIMIENTO, MANTENIMIENTOACTIVIDAD.STATUS FROM PROGRAMAMAN' +
              'TENIMIENTO'#10'INNER JOIN MANTENIMIENTOACTIVIDAD ON MANTENIMIENTOACT' +
              'IVIDAD.IDPROGRAMAMANTENIMIENTO = PROGRAMAMANTENIMIENTO.IDPROGRAM' +
              'AMANTENIMIENTO'#10'INNER JOIN TIPOMANTENIMIENTO ON TIPOMANTENIMIENTO' +
              '.IDTIPOMANTENIMIENTO = PROGRAMAMANTENIMIENTO.IDTIPOMOVIMIENTO'#10'WH' +
              'ERE PROGRAMAMANTENIMIENTO.IDESTACION = @IDESTACION AND MANTENIMI' +
              'ENTOACTIVIDAD.STATUS= '#39'PENDIENTE'#39' AND CAST(MANTENIMIENTOACTIVIDA' +
              'D.FECHAAREALIZARMANTENIMIENTO AS DATE) <= CAST(GETDATE() AS DATE' +
              ') ORDER BY MANTENIMIENTOACTIVIDAD.FECHAAREALIZARMANTENIMIENTO AS' +
              'C'#10'FOR XML RAW ('#39'SERVICES'#39'), ELEMENTS)'#10'END'#10#10'SELECT CAST(@COUNT AS' +
              ' VARCHAR(100)) + @XML AS XML'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'XML'
                TableField = 'XML'
              end>
          end>
        Name = 'spObtenActividadesProgramadas'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <
          item
            Name = 'XML'
            DataType = datMemo
          end>
      end
      item
        Params = <
          item
            Name = 'EstacionID'
            DataType = datInteger
            Value = '2601'
            ParamType = daptInput
          end
          item
            Name = 'TURNO'
            DataType = datInteger
            Value = '2'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'NorthAmericanGreenHouse'
            ConnectionType = 'MSSQL'
            Default = True
            SQL = 
              'DECLARE @IDEMPLEADO INT'#10'DECLARE @FOTOEMPLEADO VARBINARY(MAX)'#10'DEC' +
              'LARE @FOTOBASE64 VARCHAR(MAX)'#10'DECLARE @COUNT INT'#10#10'SET @COUNT = (' +
              'SELECT COUNT(HORARIOEMPLEADO.IDEMPLEADO)'#10'              FROM HORA' +
              'RIOEMPLEADO INNER JOIN EMPLEADO ON EMPLEADO.IDEMPLEADO = HORARIO' +
              'EMPLEADO.IDEMPLEADO'#10'              WHERE HORARIOEMPLEADO.IDESTACI' +
              'ON = :EstacionID AND EMPLEADO.TURNO = :TURNO)'#10'              '#10'CRE' +
              'ATE TABLE #HORARIOEMPLEADO'#10'(IDEMPLEADO INT,'#10' HORAINICIO VARCHAR(' +
              '100),     '#10' HORAFINAL VARCHAR(100),'#10' REFERENCIA VARCHAR(100),'#10' I' +
              'DESTACION INT,'#10' NOMBREEMPLEADO VARCHAR(100),'#10' FOTOEMPLEADO varbi' +
              'nary(MAX),'#10' FOTOBASE64 VARCHAR(MAX))    '#10#10'INSERT INTO #HORARIOEM' +
              'PLEADO'#10'SELECT HORARIOEMPLEADO.IDEMPLEADO, '#10'       LTRIM(RIGHT(co' +
              'nvert(VARCHAR(20), HORARIOEMPLEADO.HORAINICIO, 100),7)) HORAINIC' +
              'IO,'#10#9'   LTRIM(RIGHT(convert(VARCHAR(20), HORARIOEMPLEADO.HORAFIN' +
              'AL, 100),7))  HORAFINAL,'#10'HORARIOEMPLEADO.REFERENCIA, HORARIOEMPL' +
              'EADO.IDESTACION, HORARIOEMPLEADO.NOMBREEMPLEADO,'#10'EMPLEADO.FOTOEM' +
              'PLEADO, '#39#39#10'FROM HORARIOEMPLEADO INNER JOIN EMPLEADO ON EMPLEADO.' +
              'IDEMPLEADO = HORARIOEMPLEADO.IDEMPLEADO'#10'WHERE HORARIOEMPLEADO.ID' +
              'ESTACION = :EstacionID AND EMPLEADO.TURNO = :TURNO AND EMPLEADO.' +
              'STATUS = 1'#10#10'DECLARE CMIEMPLEADO CURSOR FOR'#10'SELECT     IDEMPLEADO' +
              #10'FROM         #HORARIOEMPLEADO'#10'OPEN CMIEMPLEADO'#10'FETCH NEXT FROM ' +
              'CMIEMPLEADO INTO @IDEMPLEADO'#10'    WHILE (@@FETCH_STATUS = 0)'#10#9'BEG' +
              'IN'#10#9#9'SET @FOTOEMPLEADO = (SELECT #HORARIOEMPLEADO.FOTOEMPLEADO F' +
              'ROM #HORARIOEMPLEADO WHERE #HORARIOEMPLEADO.IDEMPLEADO = @IDEMPL' +
              'EADO)'#10#10#9#9'SET @FOTOBASE64 = (SELECT '#10'                          CA' +
              'ST('#39#39' AS XML).value('#39'xs:base64Binary(sql:variable("@FOTOEMPLEADO' +
              '"))'#39','#39'VARCHAR(MAX)'#39') AS FOTOB64'#10'                          FROM #' +
              'HORARIOEMPLEADO'#10'                          WHERE #HORARIOEMPLEADO' +
              '.IDEMPLEADO = @IDEMPLEADO)'#10#10'        UPDATE #HORARIOEMPLEADO'#10#9#9'SE' +
              'T FOTOBASE64 = @FOTOBASE64 WHERE #HORARIOEMPLEADO.IDEMPLEADO = @' +
              'IDEMPLEADO'#10#10#9#9'SET @FOTOEMPLEADO = NULL'#10#9#9'FETCH NEXT FROM CMIEMPL' +
              'EADO INTO @IDEMPLEADO      '#10'    END'#10'    CLOSE CMIEMPLEADO'#10'    DE' +
              'ALLOCATE CMIEMPLEADO '#10#10'DECLARE @XML VARCHAR(MAX)'#10#10'SET @XML = (SE' +
              'LECT #HORARIOEMPLEADO.IDEMPLEADO, #HORARIOEMPLEADO.HORAINICIO, #' +
              'HORARIOEMPLEADO.HORAFINAL, #HORARIOEMPLEADO.IDESTACION,'#10'       #' +
              'HORARIOEMPLEADO.NOMBREEMPLEADO, #HORARIOEMPLEADO.REFERENCIA, #HO' +
              'RARIOEMPLEADO.FOTOBASE64 FROM #HORARIOEMPLEADO'#10'FOR XML RAW ('#39'SER' +
              'VICES'#39'), ELEMENTS)'#10#10'SELECT CAST(@COUNT AS VARCHAR(100)) + @XML A' +
              'S XML'#10#10'DROP TABLE #HORARIOEMPLEADO'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'XML'
                TableField = 'XML'
              end>
          end>
        Name = 'spObtenFotosEmpleado'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <
          item
            Name = 'XML'
            DataType = datString
            Size = 65536
          end>
      end
      item
        Params = <
          item
            Name = 'IDESTACION'
            DataType = datInteger
            Value = '2601'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'NorthAmericanGreenHouse'
            ConnectionType = 'MSSQL'
            Default = True
            SQL = 
              'DECLARE @XML VARCHAR(MAX)'#10'DECLARE @IDESTACION INT'#10'DECLARE @COUNT' +
              ' INT'#10#10'SET @IDESTACION = :IDESTACION'#10#10'SET @COUNT = (SELECT COUNT(' +
              'PROGRAMAMANTENIMIENTO.IDPROGRAMAMANTENIMIENTO) FROM PROGRAMAMANT' +
              'ENIMIENTO'#10'INNER JOIN MANTENIMIENTOACTIVIDAD ON MANTENIMIENTOACTI' +
              'VIDAD.IDPROGRAMAMANTENIMIENTO = PROGRAMAMANTENIMIENTO.IDPROGRAMA' +
              'MANTENIMIENTO'#10'INNER JOIN TIPOMANTENIMIENTO ON TIPOMANTENIMIENTO.' +
              'IDTIPOMANTENIMIENTO = PROGRAMAMANTENIMIENTO.IDTIPOMOVIMIENTO'#10'WHE' +
              'RE PROGRAMAMANTENIMIENTO.IDESTACION = @IDESTACION AND MANTENIMIE' +
              'NTOACTIVIDAD.STATUS= '#39'PENDIENTE'#39' AND MONTH(MANTENIMIENTOACTIVIDA' +
              'D.FECHAAREALIZARMANTENIMIENTO) <= MONTH(GETDATE())'#10'             ' +
              '                                        AND DAY(MANTENIMIENTOACT' +
              'IVIDAD.FECHAAREALIZARMANTENIMIENTO) <= DAY(GETDATE())'#10#9#9#9#9#9#9#9#9#9#9 +
              #9#9#9' AND YEAR(MANTENIMIENTOACTIVIDAD.FECHAAREALIZARMANTENIMIENTO)' +
              ' <= YEAR(GETDATE()))'#10#10'SET @XML ='#10'(SELECT PROGRAMAMANTENIMIENTO.I' +
              'DPROGRAMAMANTENIMIENTO, PROGRAMAMANTENIMIENTO.CODIGO, PROGRAMAMA' +
              'NTENIMIENTO.CONCEPTO, TIPOMANTENIMIENTO.CONCEPTO TIPOMANTO,'#10'    ' +
              '   MANTENIMIENTOACTIVIDAD.FECHAAREALIZARMANTENIMIENTO, MANTENIMI' +
              'ENTOACTIVIDAD.STATUS FROM PROGRAMAMANTENIMIENTO'#10'INNER JOIN MANTE' +
              'NIMIENTOACTIVIDAD ON MANTENIMIENTOACTIVIDAD.IDPROGRAMAMANTENIMIE' +
              'NTO = PROGRAMAMANTENIMIENTO.IDPROGRAMAMANTENIMIENTO'#10'INNER JOIN T' +
              'IPOMANTENIMIENTO ON TIPOMANTENIMIENTO.IDTIPOMANTENIMIENTO = PROG' +
              'RAMAMANTENIMIENTO.IDTIPOMOVIMIENTO'#10'WHERE PROGRAMAMANTENIMIENTO.I' +
              'DESTACION = @IDESTACION AND MANTENIMIENTOACTIVIDAD.STATUS= '#39'PEND' +
              'IENTE'#39' AND MONTH(MANTENIMIENTOACTIVIDAD.FECHAAREALIZARMANTENIMIE' +
              'NTO) <= MONTH(GETDATE())'#10'                                       ' +
              '              AND DAY(MANTENIMIENTOACTIVIDAD.FECHAAREALIZARMANTE' +
              'NIMIENTO) <= DAY(GETDATE())'#10#9#9#9#9#9#9#9#9#9#9#9#9#9' AND YEAR(MANTENIMIENTO' +
              'ACTIVIDAD.FECHAAREALIZARMANTENIMIENTO) <= YEAR(GETDATE())'#10'FOR XM' +
              'L RAW ('#39'SERVICES'#39'), ELEMENTS)'#10#10'SELECT CAST(@COUNT AS VARCHAR(100' +
              ')) + @XML AS XML'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'XML'
                TableField = 'XML'
              end>
          end>
        Name = 'spObtenNotificacionesDiarias'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <
          item
            Name = 'XML'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'IDMANTENIMIENTOACTIVIDAD'
            DataType = datInteger
            Value = '1'
            ParamType = daptInput
          end
          item
            Name = 'STATUS'
            DataType = datString
            Size = 65536
            Value = 'Actividad no Realizada'
            ParamType = daptInput
          end
          item
            Name = 'NOTA'
            DataType = datString
            Size = 65536
            Value = 'falto equipo'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'NorthAmericanGreenHouse'
            ConnectionType = 'MSSQL'
            Default = True
            SQL = 
              'DECLARE @IDMANTE INT'#10'DECLARE @FECHAAREALIZARMANTENIMIENTO AS DAT' +
              'ETIME'#10'DECLARE @PERIODICIDAD AS VARCHAR(100)'#10'DECLARE @FECHA AS DA' +
              'TETIME'#10'DECLARE @IDPROGRAMAMANTENIMIENTO INT'#10'DECLARE @PENDIENTERE' +
              'GISTRADO INT'#10#10'DECLARE @FECHAHOY DATETIME'#10#10'SET @FECHAHOY = GETDAT' +
              'E()'#10'SET @PENDIENTEREGISTRADO = 0'#10'SET @IDPROGRAMAMANTENIMIENTO = ' +
              '(SELECT IDPROGRAMAMANTENIMIENTO FROM MANTENIMIENTOACTIVIDAD WHER' +
              'E IDMANTENIMIENTOACTIVIDAD = :IDMANTENIMIENTOACTIVIDAD)'#10'SET @FEC' +
              'HAAREALIZARMANTENIMIENTO= (SELECT FECHAAREALIZARMANTENIMIENTO FR' +
              'OM MANTENIMIENTOACTIVIDAD'#10'                                   WHE' +
              'RE IDMANTENIMIENTOACTIVIDAD = :IDMANTENIMIENTOACTIVIDAD)'#10'SET @PE' +
              'RIODICIDAD = (SELECT PROGRAMAMANTENIMIENTO.PERIODICIDAD FROM MAN' +
              'TENIMIENTOACTIVIDAD INNER JOIN'#10'PROGRAMAMANTENIMIENTO ON PROGRAMA' +
              'MANTENIMIENTO.IDPROGRAMAMANTENIMIENTO = MANTENIMIENTOACTIVIDAD.I' +
              'DPROGRAMAMANTENIMIENTO'#10'WHERE IDMANTENIMIENTOACTIVIDAD = :IDMANTE' +
              'NIMIENTOACTIVIDAD)'#10'SET @IDMANTE = (SELECT ISNULL(MAX(IDMANTENIMI' +
              'ENTOACTIVIDAD),0)+1 FROM MANTENIMIENTOACTIVIDAD)'#10#10'IF (@PERIODICI' +
              'DAD = '#39'DIARIO'#39')'#10#9'SET @FECHA = DATEADD(day, 1, @FECHAAREALIZARMAN' +
              'TENIMIENTO)'#10#10'IF (@PERIODICIDAD = '#39'SEMANAL'#39')'#10#9'SET @FECHA = DATEAD' +
              'D(day, 7, @FECHAAREALIZARMANTENIMIENTO)'#10#10'IF (@PERIODICIDAD = '#39'ME' +
              'NSUAL'#39')'#10#9'SET @FECHA = DATEADD(month, 1, @FECHAAREALIZARMANTENIMI' +
              'ENTO)'#10#10'IF (@PERIODICIDAD = '#39'TRIMESTRAL'#39')'#10#9'SET @FECHA = DATEADD(m' +
              'onth, 3, @FECHAAREALIZARMANTENIMIENTO)'#10#10'IF (@PERIODICIDAD = '#39'CUA' +
              'TRIMESTRAL'#39')'#10#9'SET @FECHA = DATEADD(month, 4, @FECHAAREALIZARMANT' +
              'ENIMIENTO)'#10#10'IF (@PERIODICIDAD = '#39'SEMESTRAL'#39')'#10#9'SET @FECHA = DATEA' +
              'DD(month, 6, @FECHAAREALIZARMANTENIMIENTO)'#10#10'IF (@PERIODICIDAD = ' +
              #39'ANUAL'#39')'#10#9'SET @FECHA = DATEADD(month, 12, @FECHAAREALIZARMANTENI' +
              'MIENTO)'#10#9#10'SET @PENDIENTEREGISTRADO = (SELECT COUNT(IDPROGRAMAMAN' +
              'TENIMIENTO) FROM MANTENIMIENTOACTIVIDAD WHERE IDPROGRAMAMANTENIM' +
              'IENTO = @IDPROGRAMAMANTENIMIENTO AND STATUS = '#39'PENDIENTE'#39' AND ID' +
              'MANTENIMIENTOACTIVIDAD = :IDMANTENIMIENTOACTIVIDAD)'#9#10'IF (@PENDIE' +
              'NTEREGISTRADO = 1)'#10'BEGIN'#10#9#10'UPDATE MANTENIMIENTOACTIVIDAD'#10'SET STA' +
              'TUS = :STATUS,'#10'    REFERENCIA = :NOTA'#10'WHERE IDMANTENIMIENTOACTIV' +
              'IDAD = :IDMANTENIMIENTOACTIVIDAD'#10#9#10'INSERT INTO MANTENIMIENTOACTI' +
              'VIDAD SELECT @IDMANTE, @IDPROGRAMAMANTENIMIENTO, @FECHA, '#39'PENDIE' +
              'NTE'#39', '#39#39#10#10'END'#10#10'SELECT '#39'ACTIVIDAD REGISTRADA, SE REAGENDO LA ACTI' +
              'VIDAD SEGUN SU PERIODICIDAD'#39' AS RESULTADO'
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spRegistraActividadRealizada'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <
          item
            Name = 'RESULTADO'
            DataType = datString
            Size = 68
          end>
      end
      item
        Params = <
          item
            Name = 'FOTOEMPLEADO1'
            DataType = datBlob
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'FOTOEMPLEADO2'
            DataType = datBlob
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'FOTOEMPLEADO3'
            DataType = datBlob
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'FOTOEMPLEADO4'
            DataType = datBlob
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'FOTOEMPLEADO5'
            DataType = datBlob
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'FOTOEMPLEADO6'
            DataType = datBlob
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'FOTOEMPLEADO7'
            DataType = datBlob
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'FOTOEMPLEADO8'
            DataType = datBlob
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'FOTOEMPLEADO9'
            DataType = datBlob
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'FOTOEMPLEADO10'
            DataType = datBlob
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'IDEMPLEADO'
            DataType = datInteger
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'NorthAmericanGreenHouse'
            ConnectionType = 'MSSQL'
            Default = True
            TargetTable = 'dbo.EMPLEADO'
            SQL = 
              'UPDATE EMPLEADO'#10'SET  "FOTOEMPLEADO1"= :FOTOEMPLEADO1, '#10#9' "FOTOEM' +
              'PLEADO2"= :FOTOEMPLEADO2, '#10#9' "FOTOEMPLEADO3"= :FOTOEMPLEADO3, '#10#9 +
              ' "FOTOEMPLEADO4"= :FOTOEMPLEADO4, '#10#9' "FOTOEMPLEADO5"= :FOTOEMPLE' +
              'ADO5, '#10#9' "FOTOEMPLEADO6"= :FOTOEMPLEADO6, '#10#9' "FOTOEMPLEADO7"= :F' +
              'OTOEMPLEADO7, '#10#9' "FOTOEMPLEADO8"= :FOTOEMPLEADO8, '#10#9' "FOTOEMPLEA' +
              'DO9"= :FOTOEMPLEADO9, '#10#9' "FOTOEMPLEADO10"=:FOTOEMPLEADO10  '#10'WHER' +
              'E '#10#9' IDEMPLEADO = :IDEMPLEADO'#10#9' '#10'SELECT 1 AS RESULT'
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spActualizaEmpleadosRostro'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <
          item
            Name = 'RESULT'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'NOMBREEMPLEADO'
            DataType = datString
            Size = 65536
            Value = 'PEDRO'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'NorthAmericanGreenHouse'
            ConnectionType = 'MSSQL'
            Default = True
            SQL = 
              'DECLARE @NOMBREEMPLEADO VARCHAR(500) '#10'DECLARE @FOTOEMPLEADO VARB' +
              'INARY(MAX) '#10'DECLARE @FOTOBASE64 VARCHAR(MAX) '#10'DECLARE @IDEMPLEAD' +
              'O INT '#10'DECLARE @COUNT INT'#10#10'SET @NOMBREEMPLEADO = :NOMBREEMPLEADO' +
              #10#10'SET @COUNT = (SELECT COUNT(EMPLEADO.IDEMPLEADO)'#10'              ' +
              'FROM EMPLEADO WHERE EMPLEADO.NOMBRE LIKE '#39'%'#39'+@NOMBREEMPLEADO+'#39'%'#39 +
              ')'#10#10'CREATE TABLE #EMPLEADO'#10'(IDEMPLEADO INT,'#10' IDESTACION INT,'#10' NOM' +
              'BREEMPLEADO VARCHAR(100),'#10' FOTOEMPLEADO varbinary(MAX),'#10' FOTOBAS' +
              'E64 VARCHAR(MAX)) '#10#10'INSERT INTO #EMPLEADO'#10'SELECT EMPLEADO.IDEMPL' +
              'EADO, EMPLEADO.IDESTACION, EMPLEADO.NOMBRE, EMPLEADO.FOTOEMPLEAD' +
              'O1, '#39#39#10'FROM EMPLEADO WHERE EMPLEADO.NOMBRE LIKE '#39'%'#39'+@NOMBREEMPLE' +
              'ADO+'#39'%'#39#10#10'DECLARE CMIEMPLEADO CURSOR FOR'#10'SELECT  IDEMPLEADO'#10'FROM ' +
              '   #EMPLEADO'#10'OPEN CMIEMPLEADO'#10'FETCH NEXT FROM CMIEMPLEADO INTO @' +
              'IDEMPLEADO'#10'    WHILE (@@FETCH_STATUS = 0)'#10#9'BEGIN'#10#9#9'SET @FOTOEMPL' +
              'EADO = (SELECT #EMPLEADO.FOTOEMPLEADO FROM #EMPLEADO WHERE #EMPL' +
              'EADO.IDEMPLEADO = @IDEMPLEADO)'#10#10#9#9'SET @FOTOBASE64 = (SELECT '#10'   ' +
              '                       CAST('#39#39' AS XML).value('#39'xs:base64Binary(sq' +
              'l:variable("@FOTOEMPLEADO"))'#39','#39'VARCHAR(MAX)'#39') AS FOTOB64'#10'       ' +
              '                   FROM #EMPLEADO'#10'                          WHER' +
              'E #EMPLEADO.IDEMPLEADO = @IDEMPLEADO)'#10#10'        UPDATE #EMPLEADO'#10 +
              #9#9'SET FOTOBASE64 = @FOTOBASE64 WHERE #EMPLEADO.IDEMPLEADO = @IDE' +
              'MPLEADO'#10#10#9#9'SET @FOTOEMPLEADO = NULL'#10#9#9'FETCH NEXT FROM CMIEMPLEAD' +
              'O INTO @IDEMPLEADO      '#10'    END'#10'    CLOSE CMIEMPLEADO'#10'    DEALL' +
              'OCATE CMIEMPLEADO '#10#10'DECLARE @XML VARCHAR(MAX)'#10#10'SET @XML = (SELEC' +
              'T #EMPLEADO.IDEMPLEADO, #EMPLEADO.IDESTACION,'#10'            #EMPLE' +
              'ADO.NOMBREEMPLEADO, #EMPLEADO.FOTOBASE64 FROM #EMPLEADO'#10'FOR XML ' +
              'RAW ('#39'SERVICES'#39'), ELEMENTS)'#10#10'SELECT CAST(@COUNT AS VARCHAR(100))' +
              ' + @XML AS XML'#10#10'DROP TABLE #EMPLEADO'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'XML'
                TableField = 'XML'
              end>
          end>
        Name = 'spObtenFotosNombresEmpleados'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <
          item
            Name = 'XML'
            DataType = datMemo
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'NorthAmericanGreenHouse'
            ConnectionType = 'MSSQL'
            Default = True
            SQL = 'SELECT MAX(ISNULL(IDEMPLEADO,0)) + 1 AS IDEMPLEADO FROM EMPLEADO'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDEMPLEADO'
                TableField = 'IDEMPLEADO'
              end>
          end>
        Name = 'spObtenIDEmpleado'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <
          item
            Name = 'IDEMPLEADO'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'IDEMP'
            DataType = datMemo
            Value = '93'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'NorthAmericanGreenHouse'
            ConnectionType = 'MSSQL'
            Default = True
            SQL = 
              'DECLARE @IDEMP VARCHAR(500) '#10'DECLARE @FOTOEMPLEADO1 VARBINARY(MA' +
              'X) '#10'DECLARE @FOTOEMPLEADO2 VARBINARY(MAX) '#10'DECLARE @FOTOEMPLEADO' +
              '3 VARBINARY(MAX) '#10'DECLARE @FOTOEMPLEADO4 VARBINARY(MAX) '#10'DECLARE' +
              ' @FOTOEMPLEADO5 VARBINARY(MAX) '#10'DECLARE @FOTOEMPLEADO6 VARBINARY' +
              '(MAX) '#10'DECLARE @FOTOEMPLEADO7 VARBINARY(MAX) '#10'DECLARE @FOTOEMPLE' +
              'ADO8 VARBINARY(MAX) '#10'DECLARE @FOTOEMPLEADO9 VARBINARY(MAX) '#10'DECL' +
              'ARE @FOTOEMPLEADO10 VARBINARY(MAX) '#10'DECLARE @FOTO1BASE64 VARCHAR' +
              '(MAX) '#10'DECLARE @FOTO2BASE64 VARCHAR(MAX) '#10'DECLARE @FOTO3BASE64 V' +
              'ARCHAR(MAX) '#10'DECLARE @FOTO4BASE64 VARCHAR(MAX) '#10'DECLARE @FOTO5BA' +
              'SE64 VARCHAR(MAX) '#10'DECLARE @FOTO6BASE64 VARCHAR(MAX) '#10'DECLARE @F' +
              'OTO7BASE64 VARCHAR(MAX) '#10'DECLARE @FOTO8BASE64 VARCHAR(MAX) '#10'DECL' +
              'ARE @FOTO9BASE64 VARCHAR(MAX) '#10'DECLARE @FOTO10BASE64 VARCHAR(MAX' +
              ')'#10#10'DECLARE @FOTODEFAULT1 VARBINARY(MAX)'#10'DECLARE @FOTODEFAULT2 VA' +
              'RBINARY(MAX)'#10'DECLARE @FOTODEFAULT3 VARBINARY(MAX)'#10'DECLARE @FOTOD' +
              'EFAULT4 VARBINARY(MAX)'#10'DECLARE @FOTODEFAULT5 VARBINARY(MAX)'#10'DECL' +
              'ARE @FOTODEFAULT6 VARBINARY(MAX)'#10'DECLARE @FOTODEFAULT7 VARBINARY' +
              '(MAX)'#10'DECLARE @FOTODEFAULT8 VARBINARY(MAX)'#10'DECLARE @FOTODEFAULT9' +
              ' VARBINARY(MAX)'#10'DECLARE @FOTODEFAULT10 VARBINARY(MAX)'#10'DECLARE @F' +
              'OTODEFAULT1BASE64 VARCHAR(MAX)'#10'DECLARE @FOTODEFAULT2BASE64 VARCH' +
              'AR(MAX)'#10'DECLARE @FOTODEFAULT3BASE64 VARCHAR(MAX)'#10'DECLARE @FOTODE' +
              'FAULT4BASE64 VARCHAR(MAX)'#10'DECLARE @FOTODEFAULT5BASE64 VARCHAR(MA' +
              'X)'#10'DECLARE @FOTODEFAULT6BASE64 VARCHAR(MAX)'#10'DECLARE @FOTODEFAULT' +
              '7BASE64 VARCHAR(MAX)'#10'DECLARE @FOTODEFAULT8BASE64 VARCHAR(MAX)'#10'DE' +
              'CLARE @FOTODEFAULT9BASE64 VARCHAR(MAX)'#10'DECLARE @FOTODEFAULT10BAS' +
              'E64 VARCHAR(MAX)'#10#10' '#10'DECLARE @IDEMPLEADO INT '#10'DECLARE @COUNT INT'#10 +
              #10'SET @IDEMP = :IDEMP'#10#10'SET @COUNT = (SELECT COUNT(EMPLEADO.IDEMPL' +
              'EADO)'#10'              FROM EMPLEADO WHERE EMPLEADO.IDEMPLEADO LIKE' +
              ' '#39'%'#39'+@IDEMP+'#39'%'#39')'#10#10'CREATE TABLE #EMPLEADO'#10'(IDEMPLEADO INT,'#10' IDEST' +
              'ACION INT,'#10' NOMBREEMPLEADO VARCHAR(100),'#10' FOTOEMPLEADO1 varbinar' +
              'y(MAX),'#10' FOTOEMPLEADO2 varbinary(MAX),'#10' FOTOEMPLEADO3 varbinary(' +
              'MAX),'#10' FOTOEMPLEADO4 varbinary(MAX),'#10' FOTOEMPLEADO5 varbinary(MA' +
              'X),'#10' FOTOEMPLEADO6 varbinary(MAX),'#10' FOTOEMPLEADO7 varbinary(MAX)' +
              ','#10' FOTOEMPLEADO8 varbinary(MAX),'#10' FOTOEMPLEADO9 varbinary(MAX),'#10 +
              ' FOTOEMPLEADO10 varbinary(MAX),'#10' FOTO1BASE64 VARCHAR(MAX),'#10' FOTO' +
              '2BASE64 VARCHAR(MAX),'#10' FOTO3BASE64 VARCHAR(MAX),'#10' FOTO4BASE64 VA' +
              'RCHAR(MAX),'#10' FOTO5BASE64 VARCHAR(MAX),'#10' FOTO6BASE64 VARCHAR(MAX)' +
              ','#10' FOTO7BASE64 VARCHAR(MAX),'#10' FOTO8BASE64 VARCHAR(MAX),'#10' FOTO9BA' +
              'SE64 VARCHAR(MAX),'#10' FOTO10BASE64 VARCHAR(MAX),'#10' FOTODEFAULT1 var' +
              'binary(MAX),'#10' FOTODEFAULT2 varbinary(MAX),'#10' FOTODEFAULT3 varbina' +
              'ry(MAX),'#10' FOTODEFAULT4 varbinary(MAX),'#10' FOTODEFAULT5 varbinary(M' +
              'AX),'#10' FOTODEFAULT6 varbinary(MAX),'#10' FOTODEFAULT7 varbinary(MAX),' +
              #10' FOTODEFAULT8 varbinary(MAX),'#10' FOTODEFAULT9 varbinary(MAX),'#10' FO' +
              'TODEFAULT10 varbinary(MAX),'#10' FOTODEFAULT1BASE64 VARCHAR(MAX),'#10' F' +
              'OTODEFAULT2BASE64 VARCHAR(MAX),'#10' FOTODEFAULT3BASE64 VARCHAR(MAX)' +
              ','#10' FOTODEFAULT4BASE64 VARCHAR(MAX),'#10' FOTODEFAULT5BASE64 VARCHAR(' +
              'MAX),'#10' FOTODEFAULT6BASE64 VARCHAR(MAX),'#10' FOTODEFAULT7BASE64 VARC' +
              'HAR(MAX),'#10' FOTODEFAULT8BASE64 VARCHAR(MAX),'#10' FOTODEFAULT9BASE64 ' +
              'VARCHAR(MAX),'#10' FOTODEFAULT10BASE64 VARCHAR(MAX)) '#10#10'INSERT INTO #' +
              'EMPLEADO'#10'SELECT EMPLEADO.IDEMPLEADO, EMPLEADO.IDESTACION, EMPLEA' +
              'DO.NOMBRE, EMPLEADO.FOTOEMPLEADO1, '#10#9'   EMPLEADO.FOTOEMPLEADO2, ' +
              'EMPLEADO.FOTOEMPLEADO3, EMPLEADO.FOTOEMPLEADO4, EMPLEADO.FOTOEMP' +
              'LEADO5,'#10#9'   EMPLEADO.FOTOEMPLEADO6, EMPLEADO.FOTOEMPLEADO7, EMPL' +
              'EADO.FOTOEMPLEADO8, EMPLEADO.FOTOEMPLEADO9,'#10#9'   EMPLEADO.FOTOEMP' +
              'LEADO10, '#39#39', '#39#39', '#39#39', '#39#39', '#39#39', '#39#39' ,'#39#39' ,'#39#39' ,'#39#39' ,'#39#39','#10#9'   FOTODEFAULT' +
              '.FOTODEFAULT1, FOTODEFAULT.FOTODEFAULT2, FOTODEFAULT.FOTODEFAULT' +
              '3, FOTODEFAULT.FOTODEFAULT4,'#10#9'   FOTODEFAULT.FOTODEFAULT5, FOTOD' +
              'EFAULT.FOTODEFAULT6, FOTODEFAULT.FOTODEFAULT7, FOTODEFAULT.FOTOD' +
              'EFAULT8,'#10#9'   FOTODEFAULT.FOTODEFAULT9, FOTODEFAULT.FOTODEFAULT10' +
              ', '#39#39', '#39#39', '#39#39', '#39#39', '#39#39', '#39#39', '#39#39', '#39#39', '#39#39', '#39#39' '#10'FROM EMPLEADO, FOTODEF' +
              'AULT WHERE EMPLEADO.IDEMPLEADO LIKE '#39'%'#39'+@IDEMP+'#39'%'#39#10#10'DECLARE CMIE' +
              'MPLEADO CURSOR FOR'#10'SELECT  IDEMPLEADO'#10'FROM    #EMPLEADO'#10'OPEN CMI' +
              'EMPLEADO'#10'FETCH NEXT FROM CMIEMPLEADO INTO @IDEMPLEADO'#10'    WHILE ' +
              '(@@FETCH_STATUS = 0)'#10#9'BEGIN'#10#9#9'SET @FOTOEMPLEADO1 = (SELECT #EMPL' +
              'EADO.FOTOEMPLEADO1 FROM #EMPLEADO WHERE #EMPLEADO.IDEMPLEADO = @' +
              'IDEMPLEADO)'#10#9#9'SET @FOTOEMPLEADO2 = (SELECT #EMPLEADO.FOTOEMPLEAD' +
              'O2 FROM #EMPLEADO WHERE #EMPLEADO.IDEMPLEADO = @IDEMPLEADO)'#10#9#9'SE' +
              'T @FOTOEMPLEADO3 = (SELECT #EMPLEADO.FOTOEMPLEADO3 FROM #EMPLEAD' +
              'O WHERE #EMPLEADO.IDEMPLEADO = @IDEMPLEADO)'#10#9#9'SET @FOTOEMPLEADO4' +
              ' = (SELECT #EMPLEADO.FOTOEMPLEADO4 FROM #EMPLEADO WHERE #EMPLEAD' +
              'O.IDEMPLEADO = @IDEMPLEADO)'#10#9#9'SET @FOTOEMPLEADO5 = (SELECT #EMPL' +
              'EADO.FOTOEMPLEADO5 FROM #EMPLEADO WHERE #EMPLEADO.IDEMPLEADO = @' +
              'IDEMPLEADO)'#10#9#9'SET @FOTOEMPLEADO6 = (SELECT #EMPLEADO.FOTOEMPLEAD' +
              'O6 FROM #EMPLEADO WHERE #EMPLEADO.IDEMPLEADO = @IDEMPLEADO)'#10#9#9'SE' +
              'T @FOTOEMPLEADO7 = (SELECT #EMPLEADO.FOTOEMPLEADO7 FROM #EMPLEAD' +
              'O WHERE #EMPLEADO.IDEMPLEADO = @IDEMPLEADO)'#10#9#9'SET @FOTOEMPLEADO8' +
              ' = (SELECT #EMPLEADO.FOTOEMPLEADO8 FROM #EMPLEADO WHERE #EMPLEAD' +
              'O.IDEMPLEADO = @IDEMPLEADO)'#10#9#9'SET @FOTOEMPLEADO9 = (SELECT #EMPL' +
              'EADO.FOTOEMPLEADO9 FROM #EMPLEADO WHERE #EMPLEADO.IDEMPLEADO = @' +
              'IDEMPLEADO)'#10#9#9'SET @FOTOEMPLEADO10 = (SELECT #EMPLEADO.FOTOEMPLEA' +
              'DO10 FROM #EMPLEADO WHERE #EMPLEADO.IDEMPLEADO = @IDEMPLEADO)'#10#10#9 +
              #9'SET @FOTODEFAULT1 = (SELECT #EMPLEADO.FOTODEFAULT1 FROM #EMPLEA' +
              'DO WHERE #EMPLEADO.IDEMPLEADO = @IDEMPLEADO)'#10#9#9'SET @FOTODEFAULT2' +
              ' = (SELECT #EMPLEADO.FOTODEFAULT2 FROM #EMPLEADO WHERE #EMPLEADO' +
              '.IDEMPLEADO = @IDEMPLEADO)'#10#9#9'SET @FOTODEFAULT3 = (SELECT #EMPLEA' +
              'DO.FOTODEFAULT3 FROM #EMPLEADO WHERE #EMPLEADO.IDEMPLEADO = @IDE' +
              'MPLEADO)'#10#9#9'SET @FOTODEFAULT4 = (SELECT #EMPLEADO.FOTODEFAULT4 FR' +
              'OM #EMPLEADO WHERE #EMPLEADO.IDEMPLEADO = @IDEMPLEADO)'#10#9#9'SET @FO' +
              'TODEFAULT5 = (SELECT #EMPLEADO.FOTODEFAULT5 FROM #EMPLEADO WHERE' +
              ' #EMPLEADO.IDEMPLEADO = @IDEMPLEADO)'#10#9#9'SET @FOTODEFAULT6 = (SELE' +
              'CT #EMPLEADO.FOTODEFAULT6 FROM #EMPLEADO WHERE #EMPLEADO.IDEMPLE' +
              'ADO = @IDEMPLEADO)'#10#9#9'SET @FOTODEFAULT7 = (SELECT #EMPLEADO.FOTOD' +
              'EFAULT7 FROM #EMPLEADO WHERE #EMPLEADO.IDEMPLEADO = @IDEMPLEADO)' +
              #10#9#9'SET @FOTODEFAULT8 = (SELECT #EMPLEADO.FOTODEFAULT8 FROM #EMPL' +
              'EADO WHERE #EMPLEADO.IDEMPLEADO = @IDEMPLEADO)'#10#9#9'SET @FOTODEFAUL' +
              'T9 = (SELECT #EMPLEADO.FOTODEFAULT9 FROM #EMPLEADO WHERE #EMPLEA' +
              'DO.IDEMPLEADO = @IDEMPLEADO)'#10#9#9'SET @FOTODEFAULT10 = (SELECT #EMP' +
              'LEADO.FOTODEFAULT10 FROM #EMPLEADO WHERE #EMPLEADO.IDEMPLEADO = ' +
              '@IDEMPLEADO)'#10#10#9#9'SET @FOTO1BASE64 = (SELECT '#10'                    ' +
              '      CAST('#39#39' AS XML).value('#39'xs:base64Binary(sql:variable("@FOTO' +
              'EMPLEADO1"))'#39','#39'VARCHAR(MAX)'#39') AS FOTO1B64'#10'                      ' +
              '    FROM #EMPLEADO'#10'                          WHERE #EMPLEADO.IDE' +
              'MPLEADO = @IDEMPLEADO)'#10#9#9'SET @FOTO2BASE64 = (SELECT '#10'           ' +
              '               CAST('#39#39' AS XML).value('#39'xs:base64Binary(sql:variab' +
              'le("@FOTOEMPLEADO2"))'#39','#39'VARCHAR(MAX)'#39') AS FOTO2B64'#10'             ' +
              '             FROM #EMPLEADO'#10'                          WHERE #EMP' +
              'LEADO.IDEMPLEADO = @IDEMPLEADO)'#10#9#9'SET @FOTO3BASE64 = (SELECT '#10'  ' +
              '                        CAST('#39#39' AS XML).value('#39'xs:base64Binary(s' +
              'ql:variable("@FOTOEMPLEADO3"))'#39','#39'VARCHAR(MAX)'#39') AS FOTO3B64'#10'    ' +
              '                      FROM #EMPLEADO'#10'                          W' +
              'HERE #EMPLEADO.IDEMPLEADO = @IDEMPLEADO)'#10#9#9'SET @FOTO4BASE64 = (S' +
              'ELECT '#10'                          CAST('#39#39' AS XML).value('#39'xs:base6' +
              '4Binary(sql:variable("@FOTOEMPLEADO4"))'#39','#39'VARCHAR(MAX)'#39') AS FOTO' +
              '4B64'#10'                          FROM #EMPLEADO'#10'                  ' +
              '        WHERE #EMPLEADO.IDEMPLEADO = @IDEMPLEADO)'#10#9#9'SET @FOTO5BA' +
              'SE64 = (SELECT '#10'                          CAST('#39#39' AS XML).value(' +
              #39'xs:base64Binary(sql:variable("@FOTOEMPLEADO5"))'#39','#39'VARCHAR(MAX)'#39 +
              ') AS FOTO5B64'#10'                          FROM #EMPLEADO'#10'         ' +
              '                 WHERE #EMPLEADO.IDEMPLEADO = @IDEMPLEADO)'#10#9#9'SET' +
              ' @FOTO6BASE64 = (SELECT '#10'                          CAST('#39#39' AS XM' +
              'L).value('#39'xs:base64Binary(sql:variable("@FOTOEMPLEADO6"))'#39','#39'VARC' +
              'HAR(MAX)'#39') AS FOTO6B64'#10'                          FROM #EMPLEADO'#10 +
              '                          WHERE #EMPLEADO.IDEMPLEADO = @IDEMPLEA' +
              'DO)'#10#9#9'SET @FOTO7BASE64 = (SELECT '#10'                          CAST' +
              '('#39#39' AS XML).value('#39'xs:base64Binary(sql:variable("@FOTOEMPLEADO7"' +
              '))'#39','#39'VARCHAR(MAX)'#39') AS FOTO7B64'#10'                          FROM #' +
              'EMPLEADO'#10'                          WHERE #EMPLEADO.IDEMPLEADO = ' +
              '@IDEMPLEADO)'#10#9#9'SET @FOTO8BASE64 = (SELECT '#10'                     ' +
              '     CAST('#39#39' AS XML).value('#39'xs:base64Binary(sql:variable("@FOTOE' +
              'MPLEADO8"))'#39','#39'VARCHAR(MAX)'#39') AS FOTO8B64'#10'                       ' +
              '   FROM #EMPLEADO'#10'                          WHERE #EMPLEADO.IDEM' +
              'PLEADO = @IDEMPLEADO)'#10#9#9'SET @FOTO9BASE64 = (SELECT '#10'            ' +
              '              CAST('#39#39' AS XML).value('#39'xs:base64Binary(sql:variabl' +
              'e("@FOTOEMPLEADO9"))'#39','#39'VARCHAR(MAX)'#39') AS FOTO9B64'#10'              ' +
              '            FROM #EMPLEADO'#10'                          WHERE #EMPL' +
              'EADO.IDEMPLEADO = @IDEMPLEADO)'#10#9#9'SET @FOTO10BASE64 = (SELECT '#10'  ' +
              '                        CAST('#39#39' AS XML).value('#39'xs:base64Binary(s' +
              'ql:variable("@FOTOEMPLEADO10"))'#39','#39'VARCHAR(MAX)'#39') AS FOTO10B64'#10'  ' +
              '                        FROM #EMPLEADO'#10'                         ' +
              ' WHERE #EMPLEADO.IDEMPLEADO = @IDEMPLEADO)'#10#10'       '#10#10#10#9'    SET @' +
              'FOTODEFAULT1BASE64 = (SELECT '#10'                          CAST('#39#39' ' +
              'AS XML).value('#39'xs:base64Binary(sql:variable("@FOTODEFAULT1"))'#39','#39 +
              'VARCHAR(MAX)'#39') AS FOTO1B64'#10'                          FROM #EMPLE' +
              'ADO'#10'                          WHERE #EMPLEADO.IDEMPLEADO = @IDEM' +
              'PLEADO)'#10#9#9'SET @FOTODEFAULT2BASE64 = (SELECT '#10'                   ' +
              '       CAST('#39#39' AS XML).value('#39'xs:base64Binary(sql:variable("@FOT' +
              'ODEFAULT2"))'#39','#39'VARCHAR(MAX)'#39') AS FOTO2B64'#10'                      ' +
              '    FROM #EMPLEADO'#10'                          WHERE #EMPLEADO.IDE' +
              'MPLEADO = @IDEMPLEADO)'#10#9#9'SET @FOTODEFAULT3BASE64 = (SELECT '#10'    ' +
              '                      CAST('#39#39' AS XML).value('#39'xs:base64Binary(sql' +
              ':variable("@FOTODEFAULT3"))'#39','#39'VARCHAR(MAX)'#39') AS FOTO3B64'#10'       ' +
              '                   FROM #EMPLEADO'#10'                          WHER' +
              'E #EMPLEADO.IDEMPLEADO = @IDEMPLEADO)'#10#9#9'SET @FOTODEFAULT4BASE64 ' +
              '= (SELECT '#10'                          CAST('#39#39' AS XML).value('#39'xs:b' +
              'ase64Binary(sql:variable("@FOTODEFAULT4"))'#39','#39'VARCHAR(MAX)'#39') AS F' +
              'OTO4B64'#10'                          FROM #EMPLEADO'#10'               ' +
              '           WHERE #EMPLEADO.IDEMPLEADO = @IDEMPLEADO)'#10#9#9'SET @FOTO' +
              'DEFAULT5BASE64 = (SELECT '#10'                          CAST('#39#39' AS X' +
              'ML).value('#39'xs:base64Binary(sql:variable("@FOTODEFAULT5"))'#39','#39'VARC' +
              'HAR(MAX)'#39') AS FOTO5B64'#10'                          FROM #EMPLEADO'#10 +
              '                          WHERE #EMPLEADO.IDEMPLEADO = @IDEMPLEA' +
              'DO)'#10#9#9'SET @FOTODEFAULT6BASE64 = (SELECT '#10'                       ' +
              '   CAST('#39#39' AS XML).value('#39'xs:base64Binary(sql:variable("@FOTODEF' +
              'AULT6"))'#39','#39'VARCHAR(MAX)'#39') AS FOTO6B64'#10'                          ' +
              'FROM #EMPLEADO'#10'                          WHERE #EMPLEADO.IDEMPLE' +
              'ADO = @IDEMPLEADO)'#10#9#9'SET @FOTODEFAULT7BASE64 = (SELECT '#10'        ' +
              '                  CAST('#39#39' AS XML).value('#39'xs:base64Binary(sql:var' +
              'iable("@FOTODEFAULT7"))'#39','#39'VARCHAR(MAX)'#39') AS FOTO7B64'#10'           ' +
              '               FROM #EMPLEADO'#10'                          WHERE #E' +
              'MPLEADO.IDEMPLEADO = @IDEMPLEADO)'#10#9#9'SET @FOTODEFAULT8BASE64 = (S' +
              'ELECT '#10'                          CAST('#39#39' AS XML).value('#39'xs:base6' +
              '4Binary(sql:variable("@FOTODEFAULT8"))'#39','#39'VARCHAR(MAX)'#39') AS FOTO8' +
              'B64'#10'                          FROM #EMPLEADO'#10'                   ' +
              '       WHERE #EMPLEADO.IDEMPLEADO = @IDEMPLEADO)'#10#9#9'SET @FOTODEFA' +
              'ULT9BASE64 = (SELECT '#10'                          CAST('#39#39' AS XML).' +
              'value('#39'xs:base64Binary(sql:variable("@FOTODEFAULT9"))'#39','#39'VARCHAR(' +
              'MAX)'#39') AS FOTO9B64'#10'                          FROM #EMPLEADO'#10'    ' +
              '                      WHERE #EMPLEADO.IDEMPLEADO = @IDEMPLEADO)'#10 +
              #9#9'SET @FOTODEFAULT10BASE64 = (SELECT '#10'                          ' +
              'CAST('#39#39' AS XML).value('#39'xs:base64Binary(sql:variable("@FOTODEFAUL' +
              'T10"))'#39','#39'VARCHAR(MAX)'#39') AS FOTO10B64'#10'                          F' +
              'ROM #EMPLEADO'#10'                          WHERE #EMPLEADO.IDEMPLEA' +
              'DO = @IDEMPLEADO)'#10#10'        UPDATE #EMPLEADO'#10#9#9'SET FOTO1BASE64 = ' +
              '@FOTO1BASE64 WHERE #EMPLEADO.IDEMPLEADO = @IDEMPLEADO'#10#9#9'UPDATE #' +
              'EMPLEADO'#10#9#9'SET FOTO2BASE64 = @FOTO2BASE64 WHERE #EMPLEADO.IDEMPL' +
              'EADO = @IDEMPLEADO'#10#9#9'UPDATE #EMPLEADO'#10#9#9'SET FOTO3BASE64 = @FOTO3' +
              'BASE64 WHERE #EMPLEADO.IDEMPLEADO = @IDEMPLEADO'#10#9#9'UPDATE #EMPLEA' +
              'DO'#10#9#9'SET FOTO4BASE64 = @FOTO4BASE64 WHERE #EMPLEADO.IDEMPLEADO =' +
              ' @IDEMPLEADO'#10#9#9'UPDATE #EMPLEADO'#10#9#9'SET FOTO5BASE64 = @FOTO5BASE64' +
              ' WHERE #EMPLEADO.IDEMPLEADO = @IDEMPLEADO'#10#9#9'UPDATE #EMPLEADO'#10#9#9'S' +
              'ET FOTO6BASE64 = @FOTO6BASE64 WHERE #EMPLEADO.IDEMPLEADO = @IDEM' +
              'PLEADO'#10#9#9'UPDATE #EMPLEADO'#10#9#9'SET FOTO7BASE64 = @FOTO7BASE64 WHERE' +
              ' #EMPLEADO.IDEMPLEADO = @IDEMPLEADO'#10#9#9'UPDATE #EMPLEADO'#10#9#9'SET FOT' +
              'O8BASE64 = @FOTO8BASE64 WHERE #EMPLEADO.IDEMPLEADO = @IDEMPLEADO' +
              #10#9#9'UPDATE #EMPLEADO'#10#9#9'SET FOTO9BASE64 = @FOTO9BASE64 WHERE #EMPL' +
              'EADO.IDEMPLEADO = @IDEMPLEADO'#10#9#9'UPDATE #EMPLEADO'#10#9#9'SET FOTO10BAS' +
              'E64 = @FOTO10BASE64 WHERE #EMPLEADO.IDEMPLEADO = @IDEMPLEADO'#10#10#9#9 +
              'UPDATE #EMPLEADO'#10#9#9'SET FOTODEFAULT1BASE64 = @FOTODEFAULT1BASE64 ' +
              'WHERE #EMPLEADO.IDEMPLEADO = @IDEMPLEADO'#10#9#9'UPDATE #EMPLEADO'#10#9#9'SE' +
              'T FOTODEFAULT2BASE64 = @FOTODEFAULT2BASE64 WHERE #EMPLEADO.IDEMP' +
              'LEADO = @IDEMPLEADO'#10#9#9'UPDATE #EMPLEADO'#10#9#9'SET FOTODEFAULT3BASE64 ' +
              '= @FOTODEFAULT3BASE64 WHERE #EMPLEADO.IDEMPLEADO = @IDEMPLEADO'#10#9 +
              #9'UPDATE #EMPLEADO'#10#9#9'SET FOTODEFAULT4BASE64 = @FOTODEFAULT4BASE64' +
              ' WHERE #EMPLEADO.IDEMPLEADO = @IDEMPLEADO'#10#9#9'UPDATE #EMPLEADO'#10#9#9'S' +
              'ET FOTODEFAULT5BASE64 = @FOTODEFAULT5BASE64 WHERE #EMPLEADO.IDEM' +
              'PLEADO = @IDEMPLEADO'#10#9#9'UPDATE #EMPLEADO'#10#9#9'SET FOTODEFAULT6BASE64' +
              ' = @FOTODEFAULT6BASE64 WHERE #EMPLEADO.IDEMPLEADO = @IDEMPLEADO'#10 +
              #9#9'UPDATE #EMPLEADO'#10#9#9'SET FOTODEFAULT7BASE64 = @FOTODEFAULT7BASE6' +
              '4 WHERE #EMPLEADO.IDEMPLEADO = @IDEMPLEADO'#10#9#9'UPDATE #EMPLEADO'#10#9#9 +
              'SET FOTODEFAULT8BASE64 = @FOTODEFAULT8BASE64 WHERE #EMPLEADO.IDE' +
              'MPLEADO = @IDEMPLEADO'#10#9#9'UPDATE #EMPLEADO'#10#9#9'SET FOTODEFAULT9BASE6' +
              '4 = @FOTODEFAULT9BASE64 WHERE #EMPLEADO.IDEMPLEADO = @IDEMPLEADO' +
              #10#9#9'UPDATE #EMPLEADO'#10#9#9'SET FOTODEFAULT10BASE64 = @FOTODEFAULT10BA' +
              'SE64 WHERE #EMPLEADO.IDEMPLEADO = @IDEMPLEADO'#10#10#9#9'SET @FOTOEMPLEA' +
              'DO1 = NULL'#10#9#9'SET @FOTOEMPLEADO2 = NULL'#10#9#9'SET @FOTOEMPLEADO3 = NU' +
              'LL'#10#9#9'SET @FOTOEMPLEADO4 = NULL'#10#9#9'SET @FOTOEMPLEADO5 = NULL'#10#9#9'SET' +
              ' @FOTOEMPLEADO6 = NULL'#10#9#9'SET @FOTOEMPLEADO7 = NULL'#10#9#9'SET @FOTOEM' +
              'PLEADO8 = NULL'#10#9#9'SET @FOTOEMPLEADO9 = NULL'#10#9#9'SET @FOTOEMPLEADO10' +
              ' = NULL'#10#10#9#9'SET @FOTODEFAULT1 = NULL'#10#9#9'SET @FOTODEFAULT2 = NULL'#10#9 +
              #9'SET @FOTODEFAULT3 = NULL'#10#9#9'SET @FOTODEFAULT4 = NULL'#10#9#9'SET @FOTO' +
              'DEFAULT5 = NULL'#10#9#9'SET @FOTODEFAULT6 = NULL'#10#9#9'SET @FOTODEFAULT7 =' +
              ' NULL'#10#9#9'SET @FOTODEFAULT8 = NULL'#10#9#9'SET @FOTODEFAULT9 = NULL'#10#9#9'SE' +
              'T @FOTODEFAULT10 = NULL'#10#9#9'FETCH NEXT FROM CMIEMPLEADO INTO @IDEM' +
              'PLEADO      '#10'    END'#10'    CLOSE CMIEMPLEADO'#10'    DEALLOCATE CMIEMP' +
              'LEADO '#10#10'DECLARE @XML VARCHAR(MAX)'#10#10'SET @XML = (SELECT #EMPLEADO.' +
              'IDEMPLEADO, #EMPLEADO.IDESTACION,'#10'            #EMPLEADO.NOMBREEM' +
              'PLEADO, #EMPLEADO.FOTO1BASE64,'#10#9#9#9'#EMPLEADO.FOTO2BASE64, #EMPLEA' +
              'DO.FOTO3BASE64, '#10#9#9#9'#EMPLEADO.FOTO4BASE64, #EMPLEADO.FOTO5BASE64' +
              ','#10#9#9#9'#EMPLEADO.FOTO6BASE64, #EMPLEADO.FOTO7BASE64,'#10#9#9#9'#EMPLEADO.' +
              'FOTO8BASE64, #EMPLEADO.FOTO9BASE64,'#10#9#9#9'#EMPLEADO.FOTO10BASE64,#E' +
              'MPLEADO.FOTODEFAULT1BASE64,'#10#9#9#9'#EMPLEADO.FOTODEFAULT2BASE64, #EM' +
              'PLEADO.FOTODEFAULT3BASE64,'#10#9#9#9'#EMPLEADO.FOTODEFAULT4BASE64, #EMP' +
              'LEADO.FOTODEFAULT5BASE64,'#10#9#9#9'#EMPLEADO.FOTODEFAULT6BASE64, #EMPL' +
              'EADO.FOTODEFAULT7BASE64,'#10#9#9#9'#EMPLEADO.FOTODEFAULT8BASE64, #EMPLE' +
              'ADO.FOTODEFAULT9BASE64,'#10#9#9#9'#EMPLEADO.FOTODEFAULT10BASE64 FROM #E' +
              'MPLEADO'#10'FOR XML RAW ('#39'SERVICES'#39'), ELEMENTS)'#10#10'SELECT CAST(@COUNT ' +
              'AS VARCHAR(100)) + @XML AS XML'#10#10'DROP TABLE #EMPLEADO'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'XML'
                TableField = 'XML'
              end>
          end>
        Name = 'spObtenRostros10'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <
          item
            Name = 'XML'
            DataType = datMemo
          end>
      end
      item
        Params = <
          item
            Name = 'listado1'
            DataType = datString
            Size = 65536
            Value = #39'Javier Soto'#39', '#39'Omar Luna'#39
            ParamType = daptInput
          end
          item
            Name = 'listado2'
            DataType = datMemo
            Value = #39'Javier Soto'#39', '#39'Omar Luna'#39
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'NorthAmericanGreenHouse'
            ConnectionType = 'MSSQL'
            Default = True
            SQL = 
              'DECLARE @InList1 as VARCHAR(MAX)'#10'DECLARE @InList2 as VARCHAR(MAX' +
              ')'#10'DECLARE @LISTADO1 as VARCHAR(MAX)'#10'DECLARE @LISTADO2 as VARCHAR' +
              '(MAX)'#10#10'DECLARE @FOTODEFAULT1 VARBINARY(MAX)'#10'DECLARE @FOTODEFAULT' +
              '2 VARBINARY(MAX)'#10'DECLARE @FOTODEFAULT3 VARBINARY(MAX)'#10'DECLARE @F' +
              'OTODEFAULT4 VARBINARY(MAX)'#10'DECLARE @FOTODEFAULT5 VARBINARY(MAX)'#10 +
              'DECLARE @FOTODEFAULT6 VARBINARY(MAX)'#10'DECLARE @FOTODEFAULT7 VARBI' +
              'NARY(MAX)'#10'DECLARE @FOTODEFAULT8 VARBINARY(MAX)'#10'DECLARE @FOTODEFA' +
              'ULT9 VARBINARY(MAX)'#10'DECLARE @FOTODEFAULT10 VARBINARY(MAX)'#10'DECLAR' +
              'E @FOTODEFAULT1BASE64 VARCHAR(MAX)'#10'DECLARE @FOTODEFAULT2BASE64 V' +
              'ARCHAR(MAX)'#10'DECLARE @FOTODEFAULT3BASE64 VARCHAR(MAX)'#10'DECLARE @FO' +
              'TODEFAULT4BASE64 VARCHAR(MAX)'#10'DECLARE @FOTODEFAULT5BASE64 VARCHA' +
              'R(MAX)'#10'DECLARE @FOTODEFAULT6BASE64 VARCHAR(MAX)'#10'DECLARE @FOTODEF' +
              'AULT7BASE64 VARCHAR(MAX)'#10'DECLARE @FOTODEFAULT8BASE64 VARCHAR(MAX' +
              ')'#10'DECLARE @FOTODEFAULT9BASE64 VARCHAR(MAX)'#10'DECLARE @FOTODEFAULT1' +
              '0BASE64 VARCHAR(MAX)'#10#10'SET @InList1 = :listado1'#10'DECLARE @sql nvar' +
              'char(1000)'#10'DECLARE @retvalue NVARCHAR(MAX)'#10'DECLARE @ParmDef nvar' +
              'char(100);'#10'DECLARE @parmIN VARCHAR(10)'#10'SET @parmIN='#39' returned'#39#10'S' +
              'ET @ParmDef = N'#39'@retvalOUT NVARCHAR(MAX) OUTPUT'#39';'#10#10'SET @sql ='#39'SE' +
              'LECT @retvalOUT = (select distinct '#10'  STUFF('#10'         (SELECT '#39'+' +
              #39#39#39'/'#39#39#39' +'#39'+ convert(varchar(MAX), t2.NOMBRE, 120)'#10'          FROM' +
              ' EMPLEADO t2'#10'          where t2.NOMBRE NOT IN ('#39'+@InList1+'#39') '#10'  ' +
              '        FOR XML PATH ('#39#39#39#39'))'#10'          , 1, 1, '#39#39#39#39')  AS listado' +
              #10'from EMPLEADO t1)'#39#10#10'EXEC sp_executesql @sql,@ParmDef,@retvalOUT' +
              '=@retvalue OUTPUT'#10'SET @LISTADO1 =  @retvalue'#10#10#10'SET @InList2 = :l' +
              'istado2'#10#10'SET @sql ='#39'SELECT @retvalOUT = (select distinct '#10'  STUF' +
              'F('#10'         (SELECT '#39'+'#39#39#39'/'#39#39#39' +'#39'+ convert(varchar(MAX), t2.NOMBR' +
              'E, 120)'#10'          FROM USUARIO t2'#10'          where t2.NOMBRE NOT ' +
              'IN ('#39'+@InList2+'#39') '#10'          FOR XML PATH ('#39#39#39#39'))'#10'          , 1,' +
              ' 1, '#39#39#39#39')  AS listado'#10'from EMPLEADO t1)'#39#10#10'EXEC sp_executesql @sq' +
              'l,@ParmDef,@retvalOUT=@retvalue OUTPUT'#10'SET @LISTADO2 =  @retvalu' +
              'e'#10#10#10'CREATE TABLE #EMPLEADO'#10'(NOMBRESEMPLEADOS VARCHAR(MAX),'#10' NOMB' +
              'RESUSUARIOS VARCHAR(MAX),'#10' FOTODEFAULT1 varbinary(MAX),'#10' FOTODEF' +
              'AULT2 varbinary(MAX),'#10' FOTODEFAULT3 varbinary(MAX),'#10' FOTODEFAULT' +
              '4 varbinary(MAX),'#10' FOTODEFAULT5 varbinary(MAX),'#10' FOTODEFAULT6 va' +
              'rbinary(MAX),'#10' FOTODEFAULT7 varbinary(MAX),'#10' FOTODEFAULT8 varbin' +
              'ary(MAX),'#10' FOTODEFAULT9 varbinary(MAX),'#10' FOTODEFAULT10 varbinary' +
              '(MAX),'#10' FOTODEFAULT1BASE64 VARCHAR(MAX),'#10' FOTODEFAULT2BASE64 VAR' +
              'CHAR(MAX),'#10' FOTODEFAULT3BASE64 VARCHAR(MAX),'#10' FOTODEFAULT4BASE64' +
              ' VARCHAR(MAX),'#10' FOTODEFAULT5BASE64 VARCHAR(MAX),'#10' FOTODEFAULT6BA' +
              'SE64 VARCHAR(MAX),'#10' FOTODEFAULT7BASE64 VARCHAR(MAX),'#10' FOTODEFAUL' +
              'T8BASE64 VARCHAR(MAX),'#10' FOTODEFAULT9BASE64 VARCHAR(MAX),'#10' FOTODE' +
              'FAULT10BASE64 VARCHAR(MAX)) '#10#10'INSERT INTO #EMPLEADO'#10'SELECT @LIST' +
              'ADO1,@LISTADO2,FOTODEFAULT.FOTODEFAULT1, FOTODEFAULT.FOTODEFAULT' +
              '2, FOTODEFAULT.FOTODEFAULT3, FOTODEFAULT.FOTODEFAULT4,'#10#9'   FOTOD' +
              'EFAULT.FOTODEFAULT5, FOTODEFAULT.FOTODEFAULT6, FOTODEFAULT.FOTOD' +
              'EFAULT7, FOTODEFAULT.FOTODEFAULT8,'#10#9'   FOTODEFAULT.FOTODEFAULT9,' +
              ' FOTODEFAULT.FOTODEFAULT10,'#39#39','#39#39','#39#39','#39#39','#39#39','#39#39','#39#39','#39#39','#39#39','#39#39' '#10'FROM  ' +
              ' FOTODEFAULT'#10#9#9#10'SET @FOTODEFAULT1 = (SELECT #EMPLEADO.FOTODEFAUL' +
              'T1 FROM #EMPLEADO)'#10'SET @FOTODEFAULT2 = (SELECT #EMPLEADO.FOTODEF' +
              'AULT2 FROM #EMPLEADO)'#10'SET @FOTODEFAULT3 = (SELECT #EMPLEADO.FOTO' +
              'DEFAULT3 FROM #EMPLEADO)'#10'SET @FOTODEFAULT4 = (SELECT #EMPLEADO.F' +
              'OTODEFAULT4 FROM #EMPLEADO)'#10'SET @FOTODEFAULT5 = (SELECT #EMPLEAD' +
              'O.FOTODEFAULT5 FROM #EMPLEADO)'#10'SET @FOTODEFAULT6 = (SELECT #EMPL' +
              'EADO.FOTODEFAULT6 FROM #EMPLEADO)'#10'SET @FOTODEFAULT7 = (SELECT #E' +
              'MPLEADO.FOTODEFAULT7 FROM #EMPLEADO)'#10'SET @FOTODEFAULT8 = (SELECT' +
              ' #EMPLEADO.FOTODEFAULT8 FROM #EMPLEADO)'#10'SET @FOTODEFAULT9 = (SEL' +
              'ECT #EMPLEADO.FOTODEFAULT9 FROM #EMPLEADO)'#10'SET @FOTODEFAULT10 = ' +
              '(SELECT #EMPLEADO.FOTODEFAULT10 FROM #EMPLEADO)   '#10#10'SET @FOTODEF' +
              'AULT1BASE64 = (SELECT '#10'                          CAST('#39#39' AS XML)' +
              '.value('#39'xs:base64Binary(sql:variable("@FOTODEFAULT1"))'#39','#39'VARCHAR' +
              '(MAX)'#39') AS FOTO1B64'#10'                          FROM #EMPLEADO)'#10'SE' +
              'T @FOTODEFAULT2BASE64 = (SELECT '#10'                          CAST(' +
              #39#39' AS XML).value('#39'xs:base64Binary(sql:variable("@FOTODEFAULT2"))' +
              #39','#39'VARCHAR(MAX)'#39') AS FOTO2B64'#10'                          FROM #EM' +
              'PLEADO)'#10'SET @FOTODEFAULT3BASE64 = (SELECT '#10'                     ' +
              '     CAST('#39#39' AS XML).value('#39'xs:base64Binary(sql:variable("@FOTOD' +
              'EFAULT3"))'#39','#39'VARCHAR(MAX)'#39') AS FOTO3B64'#10'                        ' +
              '  FROM #EMPLEADO)'#10'SET @FOTODEFAULT4BASE64 = (SELECT '#10'           ' +
              '               CAST('#39#39' AS XML).value('#39'xs:base64Binary(sql:variab' +
              'le("@FOTODEFAULT4"))'#39','#39'VARCHAR(MAX)'#39') AS FOTO4B64'#10'              ' +
              '            FROM #EMPLEADO)'#10'SET @FOTODEFAULT5BASE64 = (SELECT '#10' ' +
              '                         CAST('#39#39' AS XML).value('#39'xs:base64Binary(' +
              'sql:variable("@FOTODEFAULT5"))'#39','#39'VARCHAR(MAX)'#39') AS FOTO5B64'#10'    ' +
              '                      FROM #EMPLEADO)'#10'SET @FOTODEFAULT6BASE64 = ' +
              '(SELECT '#10'                          CAST('#39#39' AS XML).value('#39'xs:bas' +
              'e64Binary(sql:variable("@FOTODEFAULT6"))'#39','#39'VARCHAR(MAX)'#39') AS FOT' +
              'O6B64'#10'                          FROM #EMPLEADO)'#10'SET @FOTODEFAULT' +
              '7BASE64 = (SELECT '#10'                          CAST('#39#39' AS XML).val' +
              'ue('#39'xs:base64Binary(sql:variable("@FOTODEFAULT7"))'#39','#39'VARCHAR(MAX' +
              ')'#39') AS FOTO7B64'#10'                          FROM #EMPLEADO)'#10'SET @F' +
              'OTODEFAULT8BASE64 = (SELECT '#10'                          CAST('#39#39' A' +
              'S XML).value('#39'xs:base64Binary(sql:variable("@FOTODEFAULT8"))'#39','#39'V' +
              'ARCHAR(MAX)'#39') AS FOTO8B64'#10'                          FROM #EMPLEA' +
              'DO)'#10'SET @FOTODEFAULT9BASE64 = (SELECT '#10'                         ' +
              ' CAST('#39#39' AS XML).value('#39'xs:base64Binary(sql:variable("@FOTODEFAU' +
              'LT9"))'#39','#39'VARCHAR(MAX)'#39') AS FOTO9B64'#10'                          FR' +
              'OM #EMPLEADO)'#10'SET @FOTODEFAULT10BASE64 = (SELECT '#10'              ' +
              '            CAST('#39#39' AS XML).value('#39'xs:base64Binary(sql:variable(' +
              '"@FOTODEFAULT10"))'#39','#39'VARCHAR(MAX)'#39') AS FOTO10B64'#10'               ' +
              '           FROM #EMPLEADO)'#10#9#9#10'UPDATE #EMPLEADO'#10'SET FOTODEFAULT1B' +
              'ASE64 = @FOTODEFAULT1BASE64'#10'UPDATE #EMPLEADO'#10'SET FOTODEFAULT2BAS' +
              'E64 = @FOTODEFAULT2BASE64'#10'UPDATE #EMPLEADO'#10'SET FOTODEFAULT3BASE6' +
              '4 = @FOTODEFAULT3BASE64'#10'UPDATE #EMPLEADO'#10'SET FOTODEFAULT4BASE64 ' +
              '= @FOTODEFAULT4BASE64'#10'UPDATE #EMPLEADO'#10'SET FOTODEFAULT5BASE64 = ' +
              '@FOTODEFAULT5BASE64'#10'UPDATE #EMPLEADO'#10'SET FOTODEFAULT6BASE64 = @F' +
              'OTODEFAULT6BASE64'#10'UPDATE #EMPLEADO'#10'SET FOTODEFAULT7BASE64 = @FOT' +
              'ODEFAULT7BASE64'#10'UPDATE #EMPLEADO'#10'SET FOTODEFAULT8BASE64 = @FOTOD' +
              'EFAULT8BASE64'#10'UPDATE #EMPLEADO'#10'SET FOTODEFAULT9BASE64 = @FOTODEF' +
              'AULT9BASE64'#10'UPDATE #EMPLEADO'#10'SET FOTODEFAULT10BASE64 = @FOTODEFA' +
              'ULT10BASE64'#10#10'DECLARE @XML VARCHAR(MAX)'#10#10'SET @XML = (SELECT #EMPL' +
              'EADO.NOMBRESEMPLEADOS, #EMPLEADO.NOMBRESUSUARIOS, '#10'           #E' +
              'MPLEADO.FOTODEFAULT1BASE64, #EMPLEADO.FOTODEFAULT2BASE64, '#10'     ' +
              '      #EMPLEADO.FOTODEFAULT3BASE64, #EMPLEADO.FOTODEFAULT4BASE64' +
              ', '#10'           #EMPLEADO.FOTODEFAULT5BASE64, #EMPLEADO.FOTODEFAUL' +
              'T6BASE64, '#10'           #EMPLEADO.FOTODEFAULT7BASE64, #EMPLEADO.FO' +
              'TODEFAULT8BASE64, '#10'           #EMPLEADO.FOTODEFAULT9BASE64, #EMP' +
              'LEADO.FOTODEFAULT10BASE64 FROM #EMPLEADO'#10'FOR XML RAW ('#39'SERVICES'#39 +
              '), ELEMENTS)'#10#10'SELECT  @XML AS XML'#10#10'DROP TABLE #EMPLEADO'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'XML'
                TableField = 'XML'
              end>
          end>
        Name = 'spObtenListadoSyncronizar'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <
          item
            Name = 'XML'
            DataType = datMemo
          end>
      end
      item
        Params = <
          item
            Name = 'LISTADOSYNCRONIZAR'
            DataType = datString
            Value = #39'Javier Soto'#39','#39'jesus armeida'#39','#39'Shula Preciosa'#39','#39'Flakita Flakita'#39
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'NorthAmericanGreenHouse'
            ConnectionType = 'MSSQL'
            Default = True
            SQL = 
              'DECLARE @IDEMP VARCHAR(MAX)'#10#10'DECLARE @NOMEMP AS VARCHAR(MAX)'#10'DEC' +
              'LARE @FEMP1 AS varbinary(MAX)'#10'DECLARE @FEMP2 AS varbinary(MAX)'#10'D' +
              'ECLARE @FEMP3 AS varbinary(MAX)'#10'DECLARE @FEMP4 AS varbinary(MAX)' +
              #10'DECLARE @FEMP5 AS varbinary(MAX)'#10'DECLARE @FEMP6 AS varbinary(MA' +
              'X)'#10'DECLARE @FEMP7 AS varbinary(MAX)'#10'DECLARE @FEMP8 AS varbinary(' +
              'MAX)'#10'DECLARE @FEMP9 AS varbinary(MAX)'#10'DECLARE @FEMP10 AS varbina' +
              'ry(MAX)'#10' '#10'DECLARE @FOTO1EMPLEADO1 VARBINARY(MAX) '#10'DECLARE @FOTO1' +
              'EMPLEADO2 VARBINARY(MAX) '#10'DECLARE @FOTO1EMPLEADO3 VARBINARY(MAX)' +
              ' '#10'DECLARE @FOTO1EMPLEADO4 VARBINARY(MAX) '#10'DECLARE @FOTO1EMPLEADO' +
              '5 VARBINARY(MAX) '#10'DECLARE @FOTO1EMPLEADO6 VARBINARY(MAX) '#10'DECLAR' +
              'E @FOTO1EMPLEADO7 VARBINARY(MAX) '#10'DECLARE @FOTO1EMPLEADO8 VARBIN' +
              'ARY(MAX) '#10'DECLARE @FOTO1EMPLEADO9 VARBINARY(MAX) '#10'DECLARE @FOTO1' +
              'EMPLEADO10 VARBINARY(MAX) '#10'DECLARE @FOTO1EMPLEADO1BASE64 VARCHAR' +
              '(MAX) '#10'DECLARE @FOTO2EMPLEADO1BASE64 VARCHAR(MAX) '#10'DECLARE @FOTO' +
              '3EMPLEADO1BASE64 VARCHAR(MAX) '#10'DECLARE @FOTO4EMPLEADO1BASE64 VAR' +
              'CHAR(MAX) '#10'DECLARE @FOTO5EMPLEADO1BASE64 VARCHAR(MAX) '#10'DECLARE @' +
              'FOTO6EMPLEADO1BASE64 VARCHAR(MAX) '#10'DECLARE @FOTO7EMPLEADO1BASE64' +
              ' VARCHAR(MAX) '#10'DECLARE @FOTO8EMPLEADO1BASE64 VARCHAR(MAX) '#10'DECLA' +
              'RE @FOTO9EMPLEADO1BASE64 VARCHAR(MAX) '#10'DECLARE @FOTO10EMPLEADO1B' +
              'ASE64 VARCHAR(MAX)'#10#10'DECLARE @FOTO2EMPLEADO1 VARBINARY(MAX) '#10'DECL' +
              'ARE @FOTO2EMPLEADO2 VARBINARY(MAX) '#10'DECLARE @FOTO2EMPLEADO3 VARB' +
              'INARY(MAX) '#10'DECLARE @FOTO2EMPLEADO4 VARBINARY(MAX) '#10'DECLARE @FOT' +
              'O2EMPLEADO5 VARBINARY(MAX) '#10'DECLARE @FOTO2EMPLEADO6 VARBINARY(MA' +
              'X) '#10'DECLARE @FOTO2EMPLEADO7 VARBINARY(MAX) '#10'DECLARE @FOTO2EMPLEA' +
              'DO8 VARBINARY(MAX) '#10'DECLARE @FOTO2EMPLEADO9 VARBINARY(MAX) '#10'DECL' +
              'ARE @FOTO2EMPLEADO10 VARBINARY(MAX) '#10'DECLARE @FOTO1EMPLEADO2BASE' +
              '64 VARCHAR(MAX) '#10'DECLARE @FOTO2EMPLEADO2BASE64 VARCHAR(MAX) '#10'DEC' +
              'LARE @FOTO3EMPLEADO2BASE64 VARCHAR(MAX) '#10'DECLARE @FOTO4EMPLEADO2' +
              'BASE64 VARCHAR(MAX) '#10'DECLARE @FOTO5EMPLEADO2BASE64 VARCHAR(MAX) ' +
              #10'DECLARE @FOTO6EMPLEADO2BASE64 VARCHAR(MAX) '#10'DECLARE @FOTO7EMPLE' +
              'ADO2BASE64 VARCHAR(MAX) '#10'DECLARE @FOTO8EMPLEADO2BASE64 VARCHAR(M' +
              'AX) '#10'DECLARE @FOTO9EMPLEADO2BASE64 VARCHAR(MAX) '#10'DECLARE @FOTO10' +
              'EMPLEADO2BASE64 VARCHAR(MAX)'#10#10'DECLARE @FOTO3EMPLEADO1 VARBINARY(' +
              'MAX) '#10'DECLARE @FOTO3EMPLEADO2 VARBINARY(MAX) '#10'DECLARE @FOTO3EMPL' +
              'EADO3 VARBINARY(MAX) '#10'DECLARE @FOTO3EMPLEADO4 VARBINARY(MAX) '#10'DE' +
              'CLARE @FOTO3EMPLEADO5 VARBINARY(MAX) '#10'DECLARE @FOTO3EMPLEADO6 VA' +
              'RBINARY(MAX) '#10'DECLARE @FOTO3EMPLEADO7 VARBINARY(MAX) '#10'DECLARE @F' +
              'OTO3EMPLEADO8 VARBINARY(MAX) '#10'DECLARE @FOTO3EMPLEADO9 VARBINARY(' +
              'MAX) '#10'DECLARE @FOTO3EMPLEADO10 VARBINARY(MAX) '#10'DECLARE @FOTO1EMP' +
              'LEADO3BASE64 VARCHAR(MAX) '#10'DECLARE @FOTO2EMPLEADO3BASE64 VARCHAR' +
              '(MAX) '#10'DECLARE @FOTO3EMPLEADO3BASE64 VARCHAR(MAX) '#10'DECLARE @FOTO' +
              '4EMPLEADO3BASE64 VARCHAR(MAX) '#10'DECLARE @FOTO5EMPLEADO3BASE64 VAR' +
              'CHAR(MAX) '#10'DECLARE @FOTO6EMPLEADO3BASE64 VARCHAR(MAX) '#10'DECLARE @' +
              'FOTO7EMPLEADO3BASE64 VARCHAR(MAX) '#10'DECLARE @FOTO8EMPLEADO3BASE64' +
              ' VARCHAR(MAX) '#10'DECLARE @FOTO9EMPLEADO3BASE64 VARCHAR(MAX) '#10'DECLA' +
              'RE @FOTO10EMPLEADO3BASE64 VARCHAR(MAX)'#10#10'DECLARE @FOTO4EMPLEADO1 ' +
              'VARBINARY(MAX) '#10'DECLARE @FOTO4EMPLEADO2 VARBINARY(MAX) '#10'DECLARE ' +
              '@FOTO4EMPLEADO3 VARBINARY(MAX) '#10'DECLARE @FOTO4EMPLEADO4 VARBINAR' +
              'Y(MAX) '#10'DECLARE @FOTO4EMPLEADO5 VARBINARY(MAX) '#10'DECLARE @FOTO4EM' +
              'PLEADO6 VARBINARY(MAX) '#10'DECLARE @FOTO4EMPLEADO7 VARBINARY(MAX) '#10 +
              'DECLARE @FOTO4EMPLEADO8 VARBINARY(MAX) '#10'DECLARE @FOTO4EMPLEADO9 ' +
              'VARBINARY(MAX) '#10'DECLARE @FOTO4EMPLEADO10 VARBINARY(MAX) '#10'DECLARE' +
              ' @FOTO1EMPLEADO4BASE64 VARCHAR(MAX) '#10'DECLARE @FOTO2EMPLEADO4BASE' +
              '64 VARCHAR(MAX) '#10'DECLARE @FOTO3EMPLEADO4BASE64 VARCHAR(MAX) '#10'DEC' +
              'LARE @FOTO4EMPLEADO4BASE64 VARCHAR(MAX) '#10'DECLARE @FOTO5EMPLEADO4' +
              'BASE64 VARCHAR(MAX) '#10'DECLARE @FOTO6EMPLEADO4BASE64 VARCHAR(MAX) ' +
              #10'DECLARE @FOTO7EMPLEADO4BASE64 VARCHAR(MAX) '#10'DECLARE @FOTO8EMPLE' +
              'ADO4BASE64 VARCHAR(MAX) '#10'DECLARE @FOTO9EMPLEADO4BASE64 VARCHAR(M' +
              'AX) '#10'DECLARE @FOTO10EMPLEADO4BASE64 VARCHAR(MAX)'#10#10'DECLARE @FOTO5' +
              'EMPLEADO1 VARBINARY(MAX) '#10'DECLARE @FOTO5EMPLEADO2 VARBINARY(MAX)' +
              ' '#10'DECLARE @FOTO5EMPLEADO3 VARBINARY(MAX) '#10'DECLARE @FOTO5EMPLEADO' +
              '4 VARBINARY(MAX) '#10'DECLARE @FOTO5EMPLEADO5 VARBINARY(MAX) '#10'DECLAR' +
              'E @FOTO5EMPLEADO6 VARBINARY(MAX) '#10'DECLARE @FOTO5EMPLEADO7 VARBIN' +
              'ARY(MAX) '#10'DECLARE @FOTO5EMPLEADO8 VARBINARY(MAX) '#10'DECLARE @FOTO5' +
              'EMPLEADO9 VARBINARY(MAX) '#10'DECLARE @FOTO5EMPLEADO10 VARBINARY(MAX' +
              ') '#10'DECLARE @FOTO1EMPLEADO5BASE64 VARCHAR(MAX) '#10'DECLARE @FOTO2EMP' +
              'LEADO5BASE64 VARCHAR(MAX) '#10'DECLARE @FOTO3EMPLEADO5BASE64 VARCHAR' +
              '(MAX) '#10'DECLARE @FOTO4EMPLEADO5BASE64 VARCHAR(MAX) '#10'DECLARE @FOTO' +
              '5EMPLEADO5BASE64 VARCHAR(MAX) '#10'DECLARE @FOTO6EMPLEADO5BASE64 VAR' +
              'CHAR(MAX) '#10'DECLARE @FOTO7EMPLEADO5BASE64 VARCHAR(MAX) '#10'DECLARE @' +
              'FOTO8EMPLEADO5BASE64 VARCHAR(MAX) '#10'DECLARE @FOTO9EMPLEADO5BASE64' +
              ' VARCHAR(MAX) '#10'DECLARE @FOTO10EMPLEADO5BASE64 VARCHAR(MAX)'#10#10'CREA' +
              'TE TABLE #EMPTEMP'#10'(IDEMPLEADO INT,'#10' IDESTACION INT,'#10' NOMBREEMPLE' +
              'ADO VARCHAR(100),'#10' FOTO1EMPLEADO1 varbinary(MAX),'#10' FOTO1EMPLEADO' +
              '2 varbinary(MAX),'#10' FOTO1EMPLEADO3 varbinary(MAX),'#10' FOTO1EMPLEADO' +
              '4 varbinary(MAX),'#10' FOTO1EMPLEADO5 varbinary(MAX),'#10' FOTO1EMPLEADO' +
              '6 varbinary(MAX),'#10' FOTO1EMPLEADO7 varbinary(MAX),'#10' FOTO1EMPLEADO' +
              '8 varbinary(MAX),'#10' FOTO1EMPLEADO9 varbinary(MAX),'#10' FOTO1EMPLEADO' +
              '10 varbinary(MAX))'#10#10'CREATE TABLE #EMPLEADO'#10'(IDEMPLEADO INT,'#10' IDE' +
              'STACION INT,'#10' NOMBREEMPLEADO VARCHAR(100),'#10' FOTO1EMPLEADO1 varbi' +
              'nary(MAX),'#10' FOTO1EMPLEADO2 varbinary(MAX),'#10' FOTO1EMPLEADO3 varbi' +
              'nary(MAX),'#10' FOTO1EMPLEADO4 varbinary(MAX),'#10' FOTO1EMPLEADO5 varbi' +
              'nary(MAX),'#10' FOTO1EMPLEADO6 varbinary(MAX),'#10' FOTO1EMPLEADO7 varbi' +
              'nary(MAX),'#10' FOTO1EMPLEADO8 varbinary(MAX),'#10' FOTO1EMPLEADO9 varbi' +
              'nary(MAX),'#10' FOTO1EMPLEADO10 varbinary(MAX),'#10' FOTO1EMPLEADO1BASE6' +
              '4 VARCHAR(MAX),'#10' FOTO2EMPLEADO1BASE64 VARCHAR(MAX),'#10' FOTO3EMPLEA' +
              'DO1BASE64 VARCHAR(MAX),'#10' FOTO4EMPLEADO1BASE64 VARCHAR(MAX),'#10' FOT' +
              'O5EMPLEADO1BASE64 VARCHAR(MAX),'#10' FOTO6EMPLEADO1BASE64 VARCHAR(MA' +
              'X),'#10' FOTO7EMPLEADO1BASE64 VARCHAR(MAX),'#10' FOTO8EMPLEADO1BASE64 VA' +
              'RCHAR(MAX),'#10' FOTO9EMPLEADO1BASE64 VARCHAR(MAX),'#10' FOTO10EMPLEADO1' +
              'BASE64 VARCHAR(MAX),'#10#10' FOTO2EMPLEADO1 varbinary(MAX),'#10' FOTO2EMPL' +
              'EADO2 varbinary(MAX),'#10' FOTO2EMPLEADO3 varbinary(MAX),'#10' FOTO2EMPL' +
              'EADO4 varbinary(MAX),'#10' FOTO2EMPLEADO5 varbinary(MAX),'#10' FOTO2EMPL' +
              'EADO6 varbinary(MAX),'#10' FOTO2EMPLEADO7 varbinary(MAX),'#10' FOTO2EMPL' +
              'EADO8 varbinary(MAX),'#10' FOTO2EMPLEADO9 varbinary(MAX),'#10' FOTO2EMPL' +
              'EADO10 varbinary(MAX),'#10' FOTO1EMPLEADO2BASE64 VARCHAR(MAX),'#10' FOTO' +
              '2EMPLEADO2BASE64 VARCHAR(MAX),'#10' FOTO3EMPLEADO2BASE64 VARCHAR(MAX' +
              '),'#10' FOTO4EMPLEADO2BASE64 VARCHAR(MAX),'#10' FOTO5EMPLEADO2BASE64 VAR' +
              'CHAR(MAX),'#10' FOTO6EMPLEADO2BASE64 VARCHAR(MAX),'#10' FOTO7EMPLEADO2BA' +
              'SE64 VARCHAR(MAX),'#10' FOTO8EMPLEADO2BASE64 VARCHAR(MAX),'#10' FOTO9EMP' +
              'LEADO2BASE64 VARCHAR(MAX),'#10' FOTO10EMPLEADO2BASE64 VARCHAR(MAX),'#10 +
              #10' FOTO3EMPLEADO1 varbinary(MAX),'#10' FOTO3EMPLEADO2 varbinary(MAX),' +
              #10' FOTO3EMPLEADO3 varbinary(MAX),'#10' FOTO3EMPLEADO4 varbinary(MAX),' +
              #10' FOTO3EMPLEADO5 varbinary(MAX),'#10' FOTO3EMPLEADO6 varbinary(MAX),' +
              #10' FOTO3EMPLEADO7 varbinary(MAX),'#10' FOTO3EMPLEADO8 varbinary(MAX),' +
              #10' FOTO3EMPLEADO9 varbinary(MAX),'#10' FOTO3EMPLEADO10 varbinary(MAX)' +
              ','#10' FOTO1EMPLEADO3BASE64 VARCHAR(MAX),'#10' FOTO2EMPLEADO3BASE64 VARC' +
              'HAR(MAX),'#10' FOTO3EMPLEADO3BASE64 VARCHAR(MAX),'#10' FOTO4EMPLEADO3BAS' +
              'E64 VARCHAR(MAX),'#10' FOTO5EMPLEADO3BASE64 VARCHAR(MAX),'#10' FOTO6EMPL' +
              'EADO3BASE64 VARCHAR(MAX),'#10' FOTO7EMPLEADO3BASE64 VARCHAR(MAX),'#10' F' +
              'OTO8EMPLEADO3BASE64 VARCHAR(MAX),'#10' FOTO9EMPLEADO3BASE64 VARCHAR(' +
              'MAX),'#10' FOTO10EMPLEADO3BASE64 VARCHAR(MAX),'#10#10' FOTO4EMPLEADO1 varb' +
              'inary(MAX),'#10' FOTO4EMPLEADO2 varbinary(MAX),'#10' FOTO4EMPLEADO3 varb' +
              'inary(MAX),'#10' FOTO4EMPLEADO4 varbinary(MAX),'#10' FOTO4EMPLEADO5 varb' +
              'inary(MAX),'#10' FOTO4EMPLEADO6 varbinary(MAX),'#10' FOTO4EMPLEADO7 varb' +
              'inary(MAX),'#10' FOTO4EMPLEADO8 varbinary(MAX),'#10' FOTO4EMPLEADO9 varb' +
              'inary(MAX),'#10' FOTO4EMPLEADO10 varbinary(MAX),'#10' FOTO1EMPLEADO4BASE' +
              '64 VARCHAR(MAX),'#10' FOTO2EMPLEADO4BASE64 VARCHAR(MAX),'#10' FOTO3EMPLE' +
              'ADO4BASE64 VARCHAR(MAX),'#10' FOTO4EMPLEADO4BASE64 VARCHAR(MAX),'#10' FO' +
              'TO5EMPLEADO4BASE64 VARCHAR(MAX),'#10' FOTO6EMPLEADO4BASE64 VARCHAR(M' +
              'AX),'#10' FOTO7EMPLEADO4BASE64 VARCHAR(MAX),'#10' FOTO8EMPLEADO4BASE64 V' +
              'ARCHAR(MAX),'#10' FOTO9EMPLEADO4BASE64 VARCHAR(MAX),'#10' FOTO10EMPLEADO' +
              '4BASE64 VARCHAR(MAX),'#10#10' FOTO5EMPLEADO1 varbinary(MAX),'#10' FOTO5EMP' +
              'LEADO2 varbinary(MAX),'#10' FOTO5EMPLEADO3 varbinary(MAX),'#10' FOTO5EMP' +
              'LEADO4 varbinary(MAX),'#10' FOTO5EMPLEADO5 varbinary(MAX),'#10' FOTO5EMP' +
              'LEADO6 varbinary(MAX),'#10' FOTO5EMPLEADO7 varbinary(MAX),'#10' FOTO5EMP' +
              'LEADO8 varbinary(MAX),'#10' FOTO5EMPLEADO9 varbinary(MAX),'#10' FOTO5EMP' +
              'LEADO10 varbinary(MAX),'#10' FOTO1EMPLEADO5BASE64 VARCHAR(MAX),'#10' FOT' +
              'O2EMPLEADO5BASE64 VARCHAR(MAX),'#10' FOTO3EMPLEADO5BASE64 VARCHAR(MA' +
              'X),'#10' FOTO4EMPLEADO5BASE64 VARCHAR(MAX),'#10' FOTO5EMPLEADO5BASE64 VA' +
              'RCHAR(MAX),'#10' FOTO6EMPLEADO5BASE64 VARCHAR(MAX),'#10' FOTO7EMPLEADO5B' +
              'ASE64 VARCHAR(MAX),'#10' FOTO8EMPLEADO5BASE64 VARCHAR(MAX),'#10' FOTO9EM' +
              'PLEADO5BASE64 VARCHAR(MAX),'#10' FOTO10EMPLEADO5BASE64 VARCHAR(MAX)'#10 +
              ' ) '#10#10'INSERT INTO #EMPLEADO'#10'SELECT '#39#39', '#39#39', '#39#39', null, null, null, ' +
              'null, null, null, null, null, null, null'#10'       , null, null, nu' +
              'll, null, null, null, null, null, null, null'#10#9'   , null, null, n' +
              'ull, null, null, null, null, null, null, null'#10#9'   , null, null, ' +
              'null, null, null, null, null, null, null, null'#10#9'   , null, null,' +
              ' null, null, null, null, null, null, null, null'#10#9'   , null, null' +
              ', null, null, null, null, null, null, null, null'#10'       , null, ' +
              'null, null, null, null, null, null, null, null, null'#10#9'   , null,' +
              ' null, null, null, null, null, null, null, null, null'#10#9'   , null' +
              ', null, null, null, null, null, null, null, null, null'#10#9'   , nul' +
              'l, null, null, null, null, null, null, null, null, null'#10#10'DECLARE' +
              ' @sql nvarchar(1000)'#10'DECLARE @retvalue NVARCHAR(MAX)'#10'DECLARE @Pa' +
              'rmDef nvarchar(100)'#10'DECLARE @parmIN VARCHAR(10)'#10'DECLARE @LISTADO' +
              'SYNCRONIZAR VARCHAR(MAX)'#10'SET @parmIN='#39' returned'#39#10'SET @ParmDef = ' +
              'N'#39'@retvalOUT NVARCHAR(MAX) OUTPUT'#39';'#10#10'/*SET @LISTADOSYNCRONIZAR =' +
              ' '#39#39#39#39'+'#39'Javier Soto'#39'+'#39#39#39#39'+'#39','#39'+ '#39#39#39#39'+'#39'jesus armeida'#39'+'#39#39#39#39'+'#39','#39' +'#39#39#39 +
              #39'+'#39'Shula Preciosa'#39'+'#39#39#39#39'+'#39','#39' +'#39#39#39#39'+'#39'Flakita Flakita'#39'+'#39#39#39#39'*/'#10'SET @' +
              'LISTADOSYNCRONIZAR = :LISTADOSYNCRONIZAR'#10#10'SET @sql ='#39'INSERT INTO' +
              ' #EMPTEMP '#39'+'#10'          '#39'SELECT EMPLEADO.IDEMPLEADO, EMPLEADO.IDE' +
              'STACION, EMPLEADO.NOMBRE, EMPLEADO.FOTOEMPLEADO1, '#39'+'#10#9'      '#39'EMP' +
              'LEADO.FOTOEMPLEADO2, EMPLEADO.FOTOEMPLEADO3, EMPLEADO.FOTOEMPLEA' +
              'DO4, EMPLEADO.FOTOEMPLEADO5, '#39'+'#10#9'      '#39'EMPLEADO.FOTOEMPLEADO6, ' +
              'EMPLEADO.FOTOEMPLEADO7, EMPLEADO.FOTOEMPLEADO8, EMPLEADO.FOTOEMP' +
              'LEADO9, '#39'+'#10#9'      '#39'EMPLEADO.FOTOEMPLEADO10 '#39'+         '#10'         ' +
              ' '#39'FROM EMPLEADO, FOTODEFAULT WHERE EMPLEADO.NOMBRE IN ('#39'+@LISTAD' +
              'OSYNCRONIZAR+'#39') '#39#10#10'EXEC (@sql)'#10#10'DECLARE @COUNT AS INT'#10'SET @COUNT' +
              ' = 1'#10#10'DECLARE CURSOREMPLEADO CURSOR FOR'#10'SELECT  NOMBREEMPLEADO, ' +
              'FOTO1EMPLEADO1, FOTO1EMPLEADO2, FOTO1EMPLEADO3, FOTO1EMPLEADO4, ' +
              'FOTO1EMPLEADO5, FOTO1EMPLEADO6,'#10'FOTO1EMPLEADO7, FOTO1EMPLEADO8, ' +
              'FOTO1EMPLEADO9, FOTO1EMPLEADO10 FROM #EMPTEMP'#10'OPEN CURSOREMPLEAD' +
              'O'#10'FETCH NEXT FROM CURSOREMPLEADO INTO @NOMEMP, @FEMP1, @FEMP2, @' +
              'FEMP3, @FEMP4, @FEMP5, @FEMP6, @FEMP7, @FEMP8, @FEMP9, @FEMP10'#10' ' +
              '   WHILE (@@FETCH_STATUS = 0)'#10#9'BEGIN'#10#10'    IF (@COUNT = 1 )'#10'    B' +
              'EGIN'#10'       UPDATE #EMPLEADO SET'#10#9'   FOTO1EMPLEADO1 = @FEMP1,'#10#9' ' +
              '  FOTO1EMPLEADO2 = @FEMP2,'#10#9'   FOTO1EMPLEADO3 = @FEMP3,'#10#9'   FOTO' +
              '1EMPLEADO4 = @FEMP4,'#10#9'   FOTO1EMPLEADO5 = @FEMP5,'#10#9'   FOTO1EMPLE' +
              'ADO6 = @FEMP6,'#10#9'   FOTO1EMPLEADO7 = @FEMP7,'#10#9'   FOTO1EMPLEADO8 =' +
              ' @FEMP8,'#10#9'   FOTO1EMPLEADO9 = @FEMP9,'#10#9'   FOTO1EMPLEADO10= @FEMP' +
              '10'#10'    END'#10#10#9'IF (@COUNT = 2 )'#10'    BEGIN'#10'       UPDATE #EMPLEADO ' +
              'SET'#10#9'   FOTO2EMPLEADO1 = @FEMP1,'#10#9'   FOTO2EMPLEADO2 = @FEMP2,'#10#9' ' +
              '  FOTO2EMPLEADO3 = @FEMP3,'#10#9'   FOTO2EMPLEADO4 = @FEMP4,'#10#9'   FOTO' +
              '2EMPLEADO5 = @FEMP5,'#10#9'   FOTO2EMPLEADO6 = @FEMP6,'#10#9'   FOTO2EMPLE' +
              'ADO7 = @FEMP7,'#10#9'   FOTO2EMPLEADO8 = @FEMP8,'#10#9'   FOTO2EMPLEADO9 =' +
              ' @FEMP9,'#10#9'   FOTO2EMPLEADO10= @FEMP10'#10'    END'#10#10#9'IF (@COUNT = 3 )' +
              #10'    BEGIN'#10'       UPDATE #EMPLEADO SET'#10#9'   FOTO3EMPLEADO1 = @FEM' +
              'P1,'#10#9'   FOTO3EMPLEADO2 = @FEMP2,'#10#9'   FOTO3EMPLEADO3 = @FEMP3,'#10#9' ' +
              '  FOTO3EMPLEADO4 = @FEMP4,'#10#9'   FOTO3EMPLEADO5 = @FEMP5,'#10#9'   FOTO' +
              '3EMPLEADO6 = @FEMP6,'#10#9'   FOTO3EMPLEADO7 = @FEMP7,'#10#9'   FOTO3EMPLE' +
              'ADO8 = @FEMP8,'#10#9'   FOTO3EMPLEADO9 = @FEMP9,'#10#9'   FOTO3EMPLEADO10=' +
              ' @FEMP10'#10'    END'#10#10#9'IF (@COUNT = 4 )'#10'    BEGIN'#10'       UPDATE #EMP' +
              'LEADO SET'#10#9'   FOTO4EMPLEADO1 = @FEMP1,'#10#9'   FOTO4EMPLEADO2 = @FEM' +
              'P2,'#10#9'   FOTO4EMPLEADO3 = @FEMP3,'#10#9'   FOTO4EMPLEADO4 = @FEMP4,'#10#9' ' +
              '  FOTO4EMPLEADO5 = @FEMP5,'#10#9'   FOTO4EMPLEADO6 = @FEMP6,'#10#9'   FOTO' +
              '4EMPLEADO7 = @FEMP7,'#10#9'   FOTO4EMPLEADO8 = @FEMP8,'#10#9'   FOTO4EMPLE' +
              'ADO9 = @FEMP9,'#10#9'   FOTO4EMPLEADO10= @FEMP10'#10'    END'#10#10#9'IF (@COUNT' +
              ' = 5 )'#10'    BEGIN'#10'       UPDATE #EMPLEADO SET'#10#9'   FOTO5EMPLEADO1 ' +
              '= @FEMP1,'#10#9'   FOTO5EMPLEADO2 = @FEMP2,'#10#9'   FOTO5EMPLEADO3 = @FEM' +
              'P3,'#10#9'   FOTO5EMPLEADO4 = @FEMP4,'#10#9'   FOTO5EMPLEADO5 = @FEMP5,'#10#9' ' +
              '  FOTO5EMPLEADO6 = @FEMP6,'#10#9'   FOTO5EMPLEADO7 = @FEMP7,'#10#9'   FOTO' +
              '5EMPLEADO8 = @FEMP8,'#10#9'   FOTO5EMPLEADO9 = @FEMP9,'#10#9'   FOTO5EMPLE' +
              'ADO10= @FEMP10'#10'    END'#10#10#9'FETCH NEXT FROM CURSOREMPLEADO INTO @NO' +
              'MEMP, @FEMP1, @FEMP2, @FEMP3, @FEMP4, @FEMP5, @FEMP6, @FEMP7, @F' +
              'EMP8, @FEMP9, @FEMP10'#10#9'SET @COUNT = @COUNT + 1      '#10#9'END'#10'CLOSE ' +
              'CURSOREMPLEADO'#10'DEALLOCATE CURSOREMPLEADO '#10'DROP TABLE #EMPTEMP'#10#10#9 +
              #9'SET @FOTO1EMPLEADO1 = (SELECT #EMPLEADO.FOTO1EMPLEADO1 FROM #EM' +
              'PLEADO)'#10#9#9'SET @FOTO1EMPLEADO2 = (SELECT #EMPLEADO.FOTO1EMPLEADO2' +
              ' FROM #EMPLEADO)'#10#9#9'SET @FOTO1EMPLEADO3 = (SELECT #EMPLEADO.FOTO1' +
              'EMPLEADO3 FROM #EMPLEADO)'#10#9#9'SET @FOTO1EMPLEADO4 = (SELECT #EMPLE' +
              'ADO.FOTO1EMPLEADO4 FROM #EMPLEADO)'#10#9#9'SET @FOTO1EMPLEADO5 = (SELE' +
              'CT #EMPLEADO.FOTO1EMPLEADO5 FROM #EMPLEADO)'#10#9#9'SET @FOTO1EMPLEADO' +
              '6 = (SELECT #EMPLEADO.FOTO1EMPLEADO6 FROM #EMPLEADO)'#10#9#9'SET @FOTO' +
              '1EMPLEADO7 = (SELECT #EMPLEADO.FOTO1EMPLEADO7 FROM #EMPLEADO)'#10#9#9 +
              'SET @FOTO1EMPLEADO8 = (SELECT #EMPLEADO.FOTO1EMPLEADO8 FROM #EMP' +
              'LEADO)'#10#9#9'SET @FOTO1EMPLEADO9 = (SELECT #EMPLEADO.FOTO1EMPLEADO9 ' +
              'FROM #EMPLEADO)'#10#9#9'SET @FOTO1EMPLEADO10 = (SELECT #EMPLEADO.FOTO1' +
              'EMPLEADO10 FROM #EMPLEADO)'#10#10#9#9'SET @FOTO2EMPLEADO1 = (SELECT #EMP' +
              'LEADO.FOTO2EMPLEADO1 FROM #EMPLEADO)'#10#9#9'SET @FOTO2EMPLEADO2 = (SE' +
              'LECT #EMPLEADO.FOTO2EMPLEADO2 FROM #EMPLEADO)'#10#9#9'SET @FOTO2EMPLEA' +
              'DO3 = (SELECT #EMPLEADO.FOTO2EMPLEADO3 FROM #EMPLEADO)'#10#9#9'SET @FO' +
              'TO2EMPLEADO4 = (SELECT #EMPLEADO.FOTO2EMPLEADO4 FROM #EMPLEADO)'#10 +
              #9#9'SET @FOTO2EMPLEADO5 = (SELECT #EMPLEADO.FOTO2EMPLEADO5 FROM #E' +
              'MPLEADO)'#10#9#9'SET @FOTO2EMPLEADO6 = (SELECT #EMPLEADO.FOTO2EMPLEADO' +
              '6 FROM #EMPLEADO)'#10#9#9'SET @FOTO2EMPLEADO7 = (SELECT #EMPLEADO.FOTO' +
              '2EMPLEADO7 FROM #EMPLEADO)'#10#9#9'SET @FOTO2EMPLEADO8 = (SELECT #EMPL' +
              'EADO.FOTO2EMPLEADO8 FROM #EMPLEADO)'#10#9#9'SET @FOTO2EMPLEADO9 = (SEL' +
              'ECT #EMPLEADO.FOTO2EMPLEADO9 FROM #EMPLEADO)'#10#9#9'SET @FOTO2EMPLEAD' +
              'O10 = (SELECT #EMPLEADO.FOTO2EMPLEADO10 FROM #EMPLEADO)'#10#10#9#9'SET @' +
              'FOTO3EMPLEADO1 = (SELECT #EMPLEADO.FOTO3EMPLEADO1 FROM #EMPLEADO' +
              ')'#10#9#9'SET @FOTO3EMPLEADO2 = (SELECT #EMPLEADO.FOTO3EMPLEADO2 FROM ' +
              '#EMPLEADO)'#10#9#9'SET @FOTO3EMPLEADO3 = (SELECT #EMPLEADO.FOTO3EMPLEA' +
              'DO3 FROM #EMPLEADO)'#10#9#9'SET @FOTO3EMPLEADO4 = (SELECT #EMPLEADO.FO' +
              'TO3EMPLEADO4 FROM #EMPLEADO)'#10#9#9'SET @FOTO3EMPLEADO5 = (SELECT #EM' +
              'PLEADO.FOTO3EMPLEADO5 FROM #EMPLEADO)'#10#9#9'SET @FOTO3EMPLEADO6 = (S' +
              'ELECT #EMPLEADO.FOTO3EMPLEADO6 FROM #EMPLEADO)'#10#9#9'SET @FOTO3EMPLE' +
              'ADO7 = (SELECT #EMPLEADO.FOTO3EMPLEADO7 FROM #EMPLEADO)'#10#9#9'SET @F' +
              'OTO3EMPLEADO8 = (SELECT #EMPLEADO.FOTO3EMPLEADO8 FROM #EMPLEADO)' +
              #10#9#9'SET @FOTO3EMPLEADO9 = (SELECT #EMPLEADO.FOTO3EMPLEADO9 FROM #' +
              'EMPLEADO)'#10#9#9'SET @FOTO3EMPLEADO10 = (SELECT #EMPLEADO.FOTO3EMPLEA' +
              'DO10 FROM #EMPLEADO)'#10#10#9#9'SET @FOTO4EMPLEADO1 = (SELECT #EMPLEADO.' +
              'FOTO4EMPLEADO1 FROM #EMPLEADO)'#10#9#9'SET @FOTO4EMPLEADO2 = (SELECT #' +
              'EMPLEADO.FOTO4EMPLEADO2 FROM #EMPLEADO)'#10#9#9'SET @FOTO4EMPLEADO3 = ' +
              '(SELECT #EMPLEADO.FOTO4EMPLEADO3 FROM #EMPLEADO)'#10#9#9'SET @FOTO4EMP' +
              'LEADO4 = (SELECT #EMPLEADO.FOTO4EMPLEADO4 FROM #EMPLEADO)'#10#9#9'SET ' +
              '@FOTO4EMPLEADO5 = (SELECT #EMPLEADO.FOTO4EMPLEADO5 FROM #EMPLEAD' +
              'O)'#10#9#9'SET @FOTO4EMPLEADO6 = (SELECT #EMPLEADO.FOTO4EMPLEADO6 FROM' +
              ' #EMPLEADO)'#10#9#9'SET @FOTO4EMPLEADO7 = (SELECT #EMPLEADO.FOTO4EMPLE' +
              'ADO7 FROM #EMPLEADO)'#10#9#9'SET @FOTO4EMPLEADO8 = (SELECT #EMPLEADO.F' +
              'OTO4EMPLEADO8 FROM #EMPLEADO)'#10#9#9'SET @FOTO4EMPLEADO9 = (SELECT #E' +
              'MPLEADO.FOTO4EMPLEADO9 FROM #EMPLEADO)'#10#9#9'SET @FOTO4EMPLEADO10 = ' +
              '(SELECT #EMPLEADO.FOTO4EMPLEADO10 FROM #EMPLEADO)'#10#10#9#9'SET @FOTO5E' +
              'MPLEADO1 = (SELECT #EMPLEADO.FOTO5EMPLEADO1 FROM #EMPLEADO)'#10#9#9'SE' +
              'T @FOTO5EMPLEADO2 = (SELECT #EMPLEADO.FOTO5EMPLEADO2 FROM #EMPLE' +
              'ADO)'#10#9#9'SET @FOTO5EMPLEADO3 = (SELECT #EMPLEADO.FOTO5EMPLEADO3 FR' +
              'OM #EMPLEADO)'#10#9#9'SET @FOTO5EMPLEADO4 = (SELECT #EMPLEADO.FOTO5EMP' +
              'LEADO4 FROM #EMPLEADO)'#10#9#9'SET @FOTO5EMPLEADO5 = (SELECT #EMPLEADO' +
              '.FOTO5EMPLEADO5 FROM #EMPLEADO)'#10#9#9'SET @FOTO5EMPLEADO6 = (SELECT ' +
              '#EMPLEADO.FOTO5EMPLEADO6 FROM #EMPLEADO)'#10#9#9'SET @FOTO5EMPLEADO7 =' +
              ' (SELECT #EMPLEADO.FOTO5EMPLEADO7 FROM #EMPLEADO)'#10#9#9'SET @FOTO5EM' +
              'PLEADO8 = (SELECT #EMPLEADO.FOTO5EMPLEADO8 FROM #EMPLEADO)'#10#9#9'SET' +
              ' @FOTO5EMPLEADO9 = (SELECT #EMPLEADO.FOTO5EMPLEADO9 FROM #EMPLEA' +
              'DO)'#10#9#9'SET @FOTO5EMPLEADO10 = (SELECT #EMPLEADO.FOTO5EMPLEADO10 F' +
              'ROM #EMPLEADO)'#10#10'/*10 FOTOS EMPLEADO 1*/'#10#9#9'SET @FOTO1EMPLEADO1BAS' +
              'E64 = (SELECT '#10'                          CAST('#39#39' AS XML).value('#39 +
              'xs:base64Binary(sql:variable("@FOTO1EMPLEADO1"))'#39','#39'VARCHAR(MAX)'#39 +
              ') AS FOTO1B64'#10'                          FROM #EMPLEADO)'#10#9#9'SET @F' +
              'OTO2EMPLEADO1BASE64 = (SELECT '#10'                          CAST('#39#39 +
              ' AS XML).value('#39'xs:base64Binary(sql:variable("@FOTO1EMPLEADO2"))' +
              #39','#39'VARCHAR(MAX)'#39') AS FOTO2B64'#10'                          FROM #EM' +
              'PLEADO)'#10#9#9'SET @FOTO3EMPLEADO1BASE64 = (SELECT '#10'                 ' +
              '         CAST('#39#39' AS XML).value('#39'xs:base64Binary(sql:variable("@F' +
              'OTO1EMPLEADO3"))'#39','#39'VARCHAR(MAX)'#39') AS FOTO3B64'#10'                  ' +
              '        FROM #EMPLEADO)'#10#9#9'SET @FOTO4EMPLEADO1BASE64 = (SELECT '#10' ' +
              '                         CAST('#39#39' AS XML).value('#39'xs:base64Binary(' +
              'sql:variable("@FOTO1EMPLEADO4"))'#39','#39'VARCHAR(MAX)'#39') AS FOTO4B64'#10'  ' +
              '                        FROM #EMPLEADO)'#10#9#9'SET @FOTO5EMPLEADO1BAS' +
              'E64 = (SELECT '#10'                          CAST('#39#39' AS XML).value('#39 +
              'xs:base64Binary(sql:variable("@FOTO1EMPLEADO5"))'#39','#39'VARCHAR(MAX)'#39 +
              ') AS FOTO5B64'#10'                          FROM #EMPLEADO)'#10#9#9'SET @F' +
              'OTO6EMPLEADO1BASE64 = (SELECT '#10'                          CAST('#39#39 +
              ' AS XML).value('#39'xs:base64Binary(sql:variable("@FOTO1EMPLEADO6"))' +
              #39','#39'VARCHAR(MAX)'#39') AS FOTO6B64'#10'                          FROM #EM' +
              'PLEADO)'#10#9#9'SET @FOTO7EMPLEADO1BASE64 = (SELECT '#10'                 ' +
              '         CAST('#39#39' AS XML).value('#39'xs:base64Binary(sql:variable("@F' +
              'OTO1EMPLEADO7"))'#39','#39'VARCHAR(MAX)'#39') AS FOTO7B64'#10'                  ' +
              '        FROM #EMPLEADO)'#10#9#9'SET @FOTO8EMPLEADO1BASE64 = (SELECT '#10' ' +
              '                         CAST('#39#39' AS XML).value('#39'xs:base64Binary(' +
              'sql:variable("@FOTO1EMPLEADO8"))'#39','#39'VARCHAR(MAX)'#39') AS FOTO8B64'#10'  ' +
              '                        FROM #EMPLEADO)'#10#9#9'SET @FOTO9EMPLEADO1BAS' +
              'E64 = (SELECT '#10'                          CAST('#39#39' AS XML).value('#39 +
              'xs:base64Binary(sql:variable("@FOTO1EMPLEADO9"))'#39','#39'VARCHAR(MAX)'#39 +
              ') AS FOTO9B64'#10'                          FROM #EMPLEADO)'#10#9#9'SET @F' +
              'OTO10EMPLEADO1BASE64 = (SELECT '#10'                          CAST('#39 +
              #39' AS XML).value('#39'xs:base64Binary(sql:variable("@FOTO1EMPLEADO10"' +
              '))'#39','#39'VARCHAR(MAX)'#39') AS FOTO10B64'#10'                          FROM ' +
              '#EMPLEADO)'#10#10'/*10 FOTOS EMPLEADO 2*/'#10#9'    SET @FOTO1EMPLEADO2BASE' +
              '64 = (SELECT '#10'                          CAST('#39#39' AS XML).value('#39'x' +
              's:base64Binary(sql:variable("@FOTO2EMPLEADO1"))'#39','#39'VARCHAR(MAX)'#39')' +
              ' AS FOTO1B64'#10'                          FROM #EMPLEADO)'#10#9#9'SET @FO' +
              'TO2EMPLEADO2BASE64 = (SELECT '#10'                          CAST('#39#39' ' +
              'AS XML).value('#39'xs:base64Binary(sql:variable("@FOTO2EMPLEADO2"))'#39 +
              ','#39'VARCHAR(MAX)'#39') AS FOTO2B64'#10'                          FROM #EMP' +
              'LEADO)'#10#9#9'SET @FOTO3EMPLEADO2BASE64 = (SELECT '#10'                  ' +
              '        CAST('#39#39' AS XML).value('#39'xs:base64Binary(sql:variable("@FO' +
              'TO2EMPLEADO3"))'#39','#39'VARCHAR(MAX)'#39') AS FOTO3B64'#10'                   ' +
              '       FROM #EMPLEADO)'#10#9#9'SET @FOTO4EMPLEADO2BASE64 = (SELECT '#10'  ' +
              '                        CAST('#39#39' AS XML).value('#39'xs:base64Binary(s' +
              'ql:variable("@FOTO2EMPLEADO4"))'#39','#39'VARCHAR(MAX)'#39') AS FOTO4B64'#10'   ' +
              '                       FROM #EMPLEADO)'#10#9#9'SET @FOTO5EMPLEADO2BASE' +
              '64 = (SELECT '#10'                          CAST('#39#39' AS XML).value('#39'x' +
              's:base64Binary(sql:variable("@FOTO2EMPLEADO5"))'#39','#39'VARCHAR(MAX)'#39')' +
              ' AS FOTO5B64'#10'                          FROM #EMPLEADO)'#10#9#9'SET @FO' +
              'TO6EMPLEADO2BASE64 = (SELECT '#10'                          CAST('#39#39' ' +
              'AS XML).value('#39'xs:base64Binary(sql:variable("@FOTO2EMPLEADO6"))'#39 +
              ','#39'VARCHAR(MAX)'#39') AS FOTO6B64'#10'                          FROM #EMP' +
              'LEADO)'#10#9#9'SET @FOTO7EMPLEADO2BASE64 = (SELECT '#10'                  ' +
              '        CAST('#39#39' AS XML).value('#39'xs:base64Binary(sql:variable("@FO' +
              'TO2EMPLEADO7"))'#39','#39'VARCHAR(MAX)'#39') AS FOTO7B64'#10'                   ' +
              '       FROM #EMPLEADO)'#10#9#9'SET @FOTO8EMPLEADO2BASE64 = (SELECT '#10'  ' +
              '                        CAST('#39#39' AS XML).value('#39'xs:base64Binary(s' +
              'ql:variable("@FOTO2EMPLEADO8"))'#39','#39'VARCHAR(MAX)'#39') AS FOTO8B64'#10'   ' +
              '                       FROM #EMPLEADO)'#10#9#9'SET @FOTO9EMPLEADO2BASE' +
              '64 = (SELECT '#10'                          CAST('#39#39' AS XML).value('#39'x' +
              's:base64Binary(sql:variable("@FOTO2EMPLEADO9"))'#39','#39'VARCHAR(MAX)'#39')' +
              ' AS FOTO9B64'#10'                          FROM #EMPLEADO)'#10#9#9'SET @FO' +
              'TO10EMPLEADO2BASE64 = (SELECT '#10'                          CAST('#39#39 +
              ' AS XML).value('#39'xs:base64Binary(sql:variable("@FOTO2EMPLEADO10")' +
              ')'#39','#39'VARCHAR(MAX)'#39') AS FOTO10B64'#10'                          FROM #' +
              'EMPLEADO)'#10#10'/*10 FOTOS EMPLEADO 3*/'#10#9#9'SET @FOTO1EMPLEADO3BASE64 =' +
              ' (SELECT '#10'                          CAST('#39#39' AS XML).value('#39'xs:ba' +
              'se64Binary(sql:variable("@FOTO3EMPLEADO1"))'#39','#39'VARCHAR(MAX)'#39') AS ' +
              'FOTO1B64'#10'                          FROM #EMPLEADO)'#10#9#9'SET @FOTO2E' +
              'MPLEADO3BASE64 = (SELECT '#10'                          CAST('#39#39' AS X' +
              'ML).value('#39'xs:base64Binary(sql:variable("@FOTO3EMPLEADO2"))'#39','#39'VA' +
              'RCHAR(MAX)'#39') AS FOTO2B64'#10'                          FROM #EMPLEAD' +
              'O)'#10#9#9'SET @FOTO3EMPLEADO3BASE64 = (SELECT '#10'                      ' +
              '    CAST('#39#39' AS XML).value('#39'xs:base64Binary(sql:variable("@FOTO3E' +
              'MPLEADO3"))'#39','#39'VARCHAR(MAX)'#39') AS FOTO3B64'#10'                       ' +
              '   FROM #EMPLEADO)'#10#9#9'SET @FOTO4EMPLEADO3BASE64 = (SELECT '#10'      ' +
              '                    CAST('#39#39' AS XML).value('#39'xs:base64Binary(sql:v' +
              'ariable("@FOTO3EMPLEADO4"))'#39','#39'VARCHAR(MAX)'#39') AS FOTO4B64'#10'       ' +
              '                   FROM #EMPLEADO)'#10#9#9'SET @FOTO5EMPLEADO3BASE64 =' +
              ' (SELECT '#10'                          CAST('#39#39' AS XML).value('#39'xs:ba' +
              'se64Binary(sql:variable("@FOTO3EMPLEADO5"))'#39','#39'VARCHAR(MAX)'#39') AS ' +
              'FOTO5B64'#10'                          FROM #EMPLEADO)'#10#9#9'SET @FOTO6E' +
              'MPLEADO3BASE64 = (SELECT '#10'                          CAST('#39#39' AS X' +
              'ML).value('#39'xs:base64Binary(sql:variable("@FOTO3EMPLEADO6"))'#39','#39'VA' +
              'RCHAR(MAX)'#39') AS FOTO6B64'#10'                          FROM #EMPLEAD' +
              'O)'#10#9#9'SET @FOTO7EMPLEADO3BASE64 = (SELECT '#10'                      ' +
              '    CAST('#39#39' AS XML).value('#39'xs:base64Binary(sql:variable("@FOTO3E' +
              'MPLEADO7"))'#39','#39'VARCHAR(MAX)'#39') AS FOTO7B64'#10'                       ' +
              '   FROM #EMPLEADO)'#10#9#9'SET @FOTO8EMPLEADO3BASE64 = (SELECT '#10'      ' +
              '                    CAST('#39#39' AS XML).value('#39'xs:base64Binary(sql:v' +
              'ariable("@FOTO3EMPLEADO8"))'#39','#39'VARCHAR(MAX)'#39') AS FOTO8B64'#10'       ' +
              '                   FROM #EMPLEADO)'#10#9#9'SET @FOTO9EMPLEADO3BASE64 =' +
              ' (SELECT '#10'                          CAST('#39#39' AS XML).value('#39'xs:ba' +
              'se64Binary(sql:variable("@FOTO3EMPLEADO9"))'#39','#39'VARCHAR(MAX)'#39') AS ' +
              'FOTO9B64'#10'                          FROM #EMPLEADO)'#10#9#9'SET @FOTO10' +
              'EMPLEADO3BASE64 = (SELECT '#10'                          CAST('#39#39' AS ' +
              'XML).value('#39'xs:base64Binary(sql:variable("@FOTO3EMPLEADO10"))'#39','#39 +
              'VARCHAR(MAX)'#39') AS FOTO10B64'#10'                          FROM #EMPL' +
              'EADO)'#10#10'/*10 FOTOS EMPLEADO 4*/'#10'        SET @FOTO1EMPLEADO4BASE64' +
              ' = (SELECT '#10'                          CAST('#39#39' AS XML).value('#39'xs:' +
              'base64Binary(sql:variable("@FOTO4EMPLEADO1"))'#39','#39'VARCHAR(MAX)'#39') A' +
              'S FOTO1B64'#10'                          FROM #EMPLEADO)'#10#9#9'SET @FOTO' +
              '2EMPLEADO4BASE64 = (SELECT '#10'                          CAST('#39#39' AS' +
              ' XML).value('#39'xs:base64Binary(sql:variable("@FOTO4EMPLEADO2"))'#39','#39 +
              'VARCHAR(MAX)'#39') AS FOTO2B64'#10'                          FROM #EMPLE' +
              'ADO)'#10#9#9'SET @FOTO3EMPLEADO4BASE64 = (SELECT '#10'                    ' +
              '      CAST('#39#39' AS XML).value('#39'xs:base64Binary(sql:variable("@FOTO' +
              '4EMPLEADO3"))'#39','#39'VARCHAR(MAX)'#39') AS FOTO3B64'#10'                     ' +
              '     FROM #EMPLEADO)'#10#9#9'SET @FOTO4EMPLEADO4BASE64 = (SELECT '#10'    ' +
              '                      CAST('#39#39' AS XML).value('#39'xs:base64Binary(sql' +
              ':variable("@FOTO4EMPLEADO4"))'#39','#39'VARCHAR(MAX)'#39') AS FOTO4B64'#10'     ' +
              '                     FROM #EMPLEADO)'#10#9#9'SET @FOTO5EMPLEADO4BASE64' +
              ' = (SELECT '#10'                          CAST('#39#39' AS XML).value('#39'xs:' +
              'base64Binary(sql:variable("@FOTO4EMPLEADO5"))'#39','#39'VARCHAR(MAX)'#39') A' +
              'S FOTO5B64'#10'                          FROM #EMPLEADO)'#10#9#9'SET @FOTO' +
              '6EMPLEADO4BASE64 = (SELECT '#10'                          CAST('#39#39' AS' +
              ' XML).value('#39'xs:base64Binary(sql:variable("@FOTO4EMPLEADO6"))'#39','#39 +
              'VARCHAR(MAX)'#39') AS FOTO6B64'#10'                          FROM #EMPLE' +
              'ADO)'#10#9#9'SET @FOTO7EMPLEADO4BASE64 = (SELECT '#10'                    ' +
              '      CAST('#39#39' AS XML).value('#39'xs:base64Binary(sql:variable("@FOTO' +
              '4EMPLEADO7"))'#39','#39'VARCHAR(MAX)'#39') AS FOTO7B64'#10'                     ' +
              '     FROM #EMPLEADO)'#10#9#9'SET @FOTO8EMPLEADO4BASE64 = (SELECT '#10'    ' +
              '                      CAST('#39#39' AS XML).value('#39'xs:base64Binary(sql' +
              ':variable("@FOTO4EMPLEADO8"))'#39','#39'VARCHAR(MAX)'#39') AS FOTO8B64'#10'     ' +
              '                     FROM #EMPLEADO)'#10#9#9'SET @FOTO9EMPLEADO4BASE64' +
              ' = (SELECT '#10'                          CAST('#39#39' AS XML).value('#39'xs:' +
              'base64Binary(sql:variable("@FOTO4EMPLEADO9"))'#39','#39'VARCHAR(MAX)'#39') A' +
              'S FOTO9B64'#10'                          FROM #EMPLEADO)'#10#9#9'SET @FOTO' +
              '10EMPLEADO4BASE64 = (SELECT '#10'                          CAST('#39#39' A' +
              'S XML).value('#39'xs:base64Binary(sql:variable("@FOTO4EMPLEADO10"))'#39 +
              ','#39'VARCHAR(MAX)'#39') AS FOTO10B64'#10'                          FROM #EM' +
              'PLEADO)'#10#10'/*10 FOTOS EMPLEADO 5*/'#10#9#9'SET @FOTO1EMPLEADO5BASE64 = (' +
              'SELECT '#10'                          CAST('#39#39' AS XML).value('#39'xs:base' +
              '64Binary(sql:variable("@FOTO5EMPLEADO1"))'#39','#39'VARCHAR(MAX)'#39') AS FO' +
              'TO1B64'#10'                          FROM #EMPLEADO)'#10#9#9'SET @FOTO2EMP' +
              'LEADO5BASE64 = (SELECT '#10'                          CAST('#39#39' AS XML' +
              ').value('#39'xs:base64Binary(sql:variable("@FOTO5EMPLEADO2"))'#39','#39'VARC' +
              'HAR(MAX)'#39') AS FOTO2B64'#10'                          FROM #EMPLEADO)' +
              #10#9#9'SET @FOTO3EMPLEADO5BASE64 = (SELECT '#10'                        ' +
              '  CAST('#39#39' AS XML).value('#39'xs:base64Binary(sql:variable("@FOTO5EMP' +
              'LEADO3"))'#39','#39'VARCHAR(MAX)'#39') AS FOTO3B64'#10'                         ' +
              ' FROM #EMPLEADO)'#10#9#9'SET @FOTO4EMPLEADO5BASE64 = (SELECT '#10'        ' +
              '                  CAST('#39#39' AS XML).value('#39'xs:base64Binary(sql:var' +
              'iable("@FOTO5EMPLEADO4"))'#39','#39'VARCHAR(MAX)'#39') AS FOTO4B64'#10'         ' +
              '                 FROM #EMPLEADO)'#10#9#9'SET @FOTO5EMPLEADO5BASE64 = (' +
              'SELECT '#10'                          CAST('#39#39' AS XML).value('#39'xs:base' +
              '64Binary(sql:variable("@FOTO5EMPLEADO5"))'#39','#39'VARCHAR(MAX)'#39') AS FO' +
              'TO5B64'#10'                          FROM #EMPLEADO)'#10#9#9'SET @FOTO6EMP' +
              'LEADO5BASE64 = (SELECT '#10'                          CAST('#39#39' AS XML' +
              ').value('#39'xs:base64Binary(sql:variable("@FOTO5EMPLEADO6"))'#39','#39'VARC' +
              'HAR(MAX)'#39') AS FOTO6B64'#10'                          FROM #EMPLEADO)' +
              #10#9#9'SET @FOTO7EMPLEADO5BASE64 = (SELECT '#10'                        ' +
              '  CAST('#39#39' AS XML).value('#39'xs:base64Binary(sql:variable("@FOTO5EMP' +
              'LEADO7"))'#39','#39'VARCHAR(MAX)'#39') AS FOTO7B64'#10'                         ' +
              ' FROM #EMPLEADO)'#10#9#9'SET @FOTO8EMPLEADO5BASE64 = (SELECT '#10'        ' +
              '                  CAST('#39#39' AS XML).value('#39'xs:base64Binary(sql:var' +
              'iable("@FOTO5EMPLEADO8"))'#39','#39'VARCHAR(MAX)'#39') AS FOTO8B64'#10'         ' +
              '                 FROM #EMPLEADO)'#10#9#9'SET @FOTO9EMPLEADO5BASE64 = (' +
              'SELECT '#10'                          CAST('#39#39' AS XML).value('#39'xs:base' +
              '64Binary(sql:variable("@FOTO5EMPLEADO9"))'#39','#39'VARCHAR(MAX)'#39') AS FO' +
              'TO9B64'#10'                          FROM #EMPLEADO)'#10#9#9'SET @FOTO10EM' +
              'PLEADO5BASE64 = (SELECT '#10'                          CAST('#39#39' AS XM' +
              'L).value('#39'xs:base64Binary(sql:variable("@FOTO5EMPLEADO10"))'#39','#39'VA' +
              'RCHAR(MAX)'#39') AS FOTO10B64'#10'                          FROM #EMPLEA' +
              'DO)'#10#10#10'        UPDATE #EMPLEADO'#10#9#9'SET FOTO1EMPLEADO1BASE64 = @FOT' +
              'O1EMPLEADO1BASE64'#10#9#9'UPDATE #EMPLEADO'#10#9#9'SET FOTO2EMPLEADO1BASE64 ' +
              '= @FOTO2EMPLEADO1BASE64'#10#9#9'UPDATE #EMPLEADO'#10#9#9'SET FOTO3EMPLEADO1B' +
              'ASE64 = @FOTO3EMPLEADO1BASE64'#10#9#9'UPDATE #EMPLEADO'#10#9#9'SET FOTO4EMPL' +
              'EADO1BASE64 = @FOTO4EMPLEADO1BASE64'#10#9#9'UPDATE #EMPLEADO'#10#9#9'SET FOT' +
              'O5EMPLEADO1BASE64 = @FOTO5EMPLEADO1BASE64'#10#9#9'UPDATE #EMPLEADO'#10#9#9'S' +
              'ET FOTO6EMPLEADO1BASE64 = @FOTO6EMPLEADO1BASE64'#10#9#9'UPDATE #EMPLEA' +
              'DO'#10#9#9'SET FOTO7EMPLEADO1BASE64 = @FOTO7EMPLEADO1BASE64'#10#9#9'UPDATE #' +
              'EMPLEADO'#10#9#9'SET FOTO8EMPLEADO1BASE64 = @FOTO8EMPLEADO1BASE64'#10#9#9'UP' +
              'DATE #EMPLEADO'#10#9#9'SET FOTO9EMPLEADO1BASE64 = @FOTO9EMPLEADO1BASE6' +
              '4'#10#9#9'UPDATE #EMPLEADO'#10#9#9'SET FOTO10EMPLEADO1BASE64 = @FOTO10EMPLEA' +
              'DO1BASE64'#10#10#9#9'UPDATE #EMPLEADO'#10#9#9'SET FOTO1EMPLEADO2BASE64 = @FOTO' +
              '1EMPLEADO2BASE64'#10#9#9'UPDATE #EMPLEADO'#10#9#9'SET FOTO2EMPLEADO2BASE64 =' +
              ' @FOTO2EMPLEADO2BASE64'#10#9#9'UPDATE #EMPLEADO'#10#9#9'SET FOTO3EMPLEADO2BA' +
              'SE64 = @FOTO3EMPLEADO2BASE64'#10#9#9'UPDATE #EMPLEADO'#10#9#9'SET FOTO4EMPLE' +
              'ADO2BASE64 = @FOTO4EMPLEADO2BASE64'#10#9#9'UPDATE #EMPLEADO'#10#9#9'SET FOTO' +
              '5EMPLEADO2BASE64 = @FOTO5EMPLEADO2BASE64'#10#9#9'UPDATE #EMPLEADO'#10#9#9'SE' +
              'T FOTO6EMPLEADO2BASE64 = @FOTO6EMPLEADO2BASE64 '#10#9#9'UPDATE #EMPLEA' +
              'DO'#10#9#9'SET FOTO7EMPLEADO2BASE64 = @FOTO7EMPLEADO2BASE64'#10#9#9'UPDATE #' +
              'EMPLEADO'#10#9#9'SET FOTO8EMPLEADO2BASE64 = @FOTO8EMPLEADO2BASE64'#10#9#9'UP' +
              'DATE #EMPLEADO'#10#9#9'SET FOTO9EMPLEADO2BASE64 = @FOTO9EMPLEADO2BASE6' +
              '4'#10#9#9'UPDATE #EMPLEADO'#10#9#9'SET FOTO10EMPLEADO2BASE64 = @FOTO10EMPLEA' +
              'DO2BASE64'#10#10#9#9'UPDATE #EMPLEADO'#10#9#9'SET FOTO1EMPLEADO3BASE64 = @FOTO' +
              '1EMPLEADO3BASE64'#10#9#9'UPDATE #EMPLEADO'#10#9#9'SET FOTO2EMPLEADO3BASE64 =' +
              ' @FOTO2EMPLEADO3BASE64'#10#9#9'UPDATE #EMPLEADO'#10#9#9'SET FOTO3EMPLEADO3BA' +
              'SE64 = @FOTO3EMPLEADO3BASE64'#10#9#9'UPDATE #EMPLEADO'#10#9#9'SET FOTO4EMPLE' +
              'ADO3BASE64 = @FOTO4EMPLEADO3BASE64'#10#9#9'UPDATE #EMPLEADO'#10#9#9'SET FOTO' +
              '5EMPLEADO3BASE64 = @FOTO5EMPLEADO3BASE64'#10#9#9'UPDATE #EMPLEADO'#10#9#9'SE' +
              'T FOTO6EMPLEADO3BASE64 = @FOTO6EMPLEADO3BASE64'#10#9#9'UPDATE #EMPLEAD' +
              'O'#10#9#9'SET FOTO7EMPLEADO3BASE64 = @FOTO7EMPLEADO3BASE64'#10#9#9'UPDATE #E' +
              'MPLEADO'#10#9#9'SET FOTO8EMPLEADO3BASE64 = @FOTO8EMPLEADO3BASE64'#10#9#9'UPD' +
              'ATE #EMPLEADO'#10#9#9'SET FOTO9EMPLEADO3BASE64 = @FOTO9EMPLEADO3BASE64' +
              #10#9#9'UPDATE #EMPLEADO'#10#9#9'SET FOTO10EMPLEADO3BASE64 = @FOTO10EMPLEAD' +
              'O3BASE64'#10#10#9#9'UPDATE #EMPLEADO'#10#9#9'SET FOTO1EMPLEADO4BASE64 = @FOTO1' +
              'EMPLEADO4BASE64'#10#9#9'UPDATE #EMPLEADO'#10#9#9'SET FOTO2EMPLEADO4BASE64 = ' +
              '@FOTO2EMPLEADO4BASE64'#10#9#9'UPDATE #EMPLEADO'#10#9#9'SET FOTO3EMPLEADO4BAS' +
              'E64 = @FOTO3EMPLEADO4BASE64'#10#9#9'UPDATE #EMPLEADO'#10#9#9'SET FOTO4EMPLEA' +
              'DO4BASE64 = @FOTO4EMPLEADO4BASE64'#10#9#9'UPDATE #EMPLEADO'#10#9#9'SET FOTO5' +
              'EMPLEADO4BASE64 = @FOTO5EMPLEADO4BASE64'#10#9#9'UPDATE #EMPLEADO'#10#9#9'SET' +
              ' FOTO6EMPLEADO4BASE64 = @FOTO6EMPLEADO4BASE64'#10#9#9'UPDATE #EMPLEADO' +
              #10#9#9'SET FOTO7EMPLEADO4BASE64 = @FOTO7EMPLEADO4BASE64'#10#9#9'UPDATE #EM' +
              'PLEADO'#10#9#9'SET FOTO8EMPLEADO4BASE64 = @FOTO8EMPLEADO4BASE64'#10#9#9'UPDA' +
              'TE #EMPLEADO'#10#9#9'SET FOTO9EMPLEADO4BASE64 = @FOTO9EMPLEADO4BASE64'#10 +
              #9#9'UPDATE #EMPLEADO'#10#9#9'SET FOTO10EMPLEADO4BASE64 = @FOTO10EMPLEADO' +
              '4BASE64'#10#10#9#9'UPDATE #EMPLEADO'#10#9#9'SET FOTO1EMPLEADO5BASE64 = @FOTO1E' +
              'MPLEADO5BASE64'#10#9#9'UPDATE #EMPLEADO'#10#9#9'SET FOTO2EMPLEADO5BASE64 = @' +
              'FOTO2EMPLEADO5BASE64'#10#9#9'UPDATE #EMPLEADO'#10#9#9'SET FOTO3EMPLEADO5BASE' +
              '64 = @FOTO3EMPLEADO5BASE64'#10#9#9'UPDATE #EMPLEADO'#10#9#9'SET FOTO4EMPLEAD' +
              'O5BASE64 = @FOTO4EMPLEADO5BASE64'#10#9#9'UPDATE #EMPLEADO'#10#9#9'SET FOTO5E' +
              'MPLEADO5BASE64 = @FOTO5EMPLEADO5BASE64'#10#9#9'UPDATE #EMPLEADO'#10#9#9'SET ' +
              'FOTO6EMPLEADO5BASE64 = @FOTO6EMPLEADO5BASE64'#10#9#9'UPDATE #EMPLEADO'#10 +
              #9#9'SET FOTO7EMPLEADO5BASE64 = @FOTO7EMPLEADO5BASE64'#10#9#9'UPDATE #EMP' +
              'LEADO'#10#9#9'SET FOTO8EMPLEADO5BASE64 = @FOTO8EMPLEADO5BASE64'#10#9#9'UPDAT' +
              'E #EMPLEADO'#10#9#9'SET FOTO9EMPLEADO5BASE64 = @FOTO9EMPLEADO5BASE64'#10#9 +
              #9'UPDATE #EMPLEADO'#10#9#9'SET FOTO10EMPLEADO5BASE64 = @FOTO10EMPLEADO5' +
              'BASE64'#10#10#9#9'SET @FOTO1EMPLEADO1 = NULL'#10#9#9'SET @FOTO1EMPLEADO2 = NUL' +
              'L'#10#9#9'SET @FOTO1EMPLEADO3 = NULL'#10#9#9'SET @FOTO1EMPLEADO4 = NULL'#10#9#9'SE' +
              'T @FOTO1EMPLEADO5 = NULL'#10#9#9'SET @FOTO1EMPLEADO6 = NULL'#10#9#9'SET @FOT' +
              'O1EMPLEADO7 = NULL'#10#9#9'SET @FOTO1EMPLEADO8 = NULL'#10#9#9'SET @FOTO1EMPL' +
              'EADO9 = NULL'#10#9#9'SET @FOTO1EMPLEADO10 = NULL'#10#10#9#9'SET @FOTO2EMPLEADO' +
              '1 = NULL'#10#9#9'SET @FOTO2EMPLEADO2 = NULL'#10#9#9'SET @FOTO2EMPLEADO3 = NU' +
              'LL'#10#9#9'SET @FOTO2EMPLEADO4 = NULL'#10#9#9'SET @FOTO2EMPLEADO5 = NULL'#10#9#9'S' +
              'ET @FOTO2EMPLEADO6 = NULL'#10#9#9'SET @FOTO2EMPLEADO7 = NULL'#10#9#9'SET @FO' +
              'TO2EMPLEADO8 = NULL'#10#9#9'SET @FOTO2EMPLEADO9 = NULL'#10#9#9'SET @FOTO2EMP' +
              'LEADO10 = NULL'#10#10#9#9'SET @FOTO3EMPLEADO1 = NULL'#10#9#9'SET @FOTO3EMPLEAD' +
              'O2 = NULL'#10#9#9'SET @FOTO3EMPLEADO3 = NULL'#10#9#9'SET @FOTO3EMPLEADO4 = N' +
              'ULL'#10#9#9'SET @FOTO3EMPLEADO5 = NULL'#10#9#9'SET @FOTO3EMPLEADO6 = NULL'#10#9#9 +
              'SET @FOTO3EMPLEADO7 = NULL'#10#9#9'SET @FOTO3EMPLEADO8 = NULL'#10#9#9'SET @F' +
              'OTO3EMPLEADO9 = NULL'#10#9#9'SET @FOTO3EMPLEADO10 = NULL'#10#10#9#9'SET @FOTO4' +
              'EMPLEADO1 = NULL'#10#9#9'SET @FOTO4EMPLEADO2 = NULL'#10#9#9'SET @FOTO4EMPLEA' +
              'DO3 = NULL'#10#9#9'SET @FOTO4EMPLEADO4 = NULL'#10#9#9'SET @FOTO4EMPLEADO5 = ' +
              'NULL'#10#9#9'SET @FOTO4EMPLEADO6 = NULL'#10#9#9'SET @FOTO4EMPLEADO7 = NULL'#10#9 +
              #9'SET @FOTO4EMPLEADO8 = NULL'#10#9#9'SET @FOTO4EMPLEADO9 = NULL'#10#9#9'SET @' +
              'FOTO4EMPLEADO10 = NULL'#10#10#9#9'SET @FOTO5EMPLEADO1 = NULL'#10#9#9'SET @FOTO' +
              '5EMPLEADO2 = NULL'#10#9#9'SET @FOTO5EMPLEADO3 = NULL'#10#9#9'SET @FOTO5EMPLE' +
              'ADO4 = NULL'#10#9#9'SET @FOTO5EMPLEADO5 = NULL'#10#9#9'SET @FOTO5EMPLEADO6 =' +
              ' NULL'#10#9#9'SET @FOTO5EMPLEADO7 = NULL'#10#9#9'SET @FOTO5EMPLEADO8 = NULL'#10 +
              #9#9'SET @FOTO5EMPLEADO9 = NULL'#10#9#9'SET @FOTO5EMPLEADO10 = NULL   '#10#10'D' +
              'ECLARE @XML VARCHAR(MAX)'#10#10'SET @XML = (SELECT #EMPLEADO.IDEMPLEAD' +
              'O, #EMPLEADO.IDESTACION,'#10'            #EMPLEADO.NOMBREEMPLEADO, #' +
              'EMPLEADO.FOTO1EMPLEADO1BASE64,'#10#9#9#9'#EMPLEADO.FOTO2EMPLEADO1BASE64' +
              ', #EMPLEADO.FOTO3EMPLEADO1BASE64, '#10#9#9#9'#EMPLEADO.FOTO4EMPLEADO1BA' +
              'SE64, #EMPLEADO.FOTO5EMPLEADO1BASE64,'#10#9#9#9'#EMPLEADO.FOTO6EMPLEADO' +
              '1BASE64, #EMPLEADO.FOTO7EMPLEADO1BASE64,'#10#9#9#9'#EMPLEADO.FOTO8EMPLE' +
              'ADO1BASE64, #EMPLEADO.FOTO9EMPLEADO1BASE64,'#10#9#9#9'#EMPLEADO.FOTO10E' +
              'MPLEADO1BASE64,#EMPLEADO.FOTO1EMPLEADO2BASE64,'#10#9#9#9'#EMPLEADO.FOTO' +
              '2EMPLEADO2BASE64, #EMPLEADO.FOTO3EMPLEADO2BASE64, '#10#9#9#9'#EMPLEADO.' +
              'FOTO4EMPLEADO2BASE64, #EMPLEADO.FOTO5EMPLEADO2BASE64,'#10#9#9#9'#EMPLEA' +
              'DO.FOTO6EMPLEADO2BASE64, #EMPLEADO.FOTO7EMPLEADO2BASE64,'#10#9#9#9'#EMP' +
              'LEADO.FOTO8EMPLEADO2BASE64, #EMPLEADO.FOTO9EMPLEADO2BASE64,'#10#9#9#9'#' +
              'EMPLEADO.FOTO10EMPLEADO2BASE64,#EMPLEADO.FOTO1EMPLEADO3BASE64,'#10#9 +
              #9#9'#EMPLEADO.FOTO2EMPLEADO3BASE64, #EMPLEADO.FOTO3EMPLEADO3BASE64' +
              ', '#10#9#9#9'#EMPLEADO.FOTO4EMPLEADO3BASE64, #EMPLEADO.FOTO5EMPLEADO3BA' +
              'SE64,'#10#9#9#9'#EMPLEADO.FOTO6EMPLEADO3BASE64, #EMPLEADO.FOTO7EMPLEADO' +
              '3BASE64,'#10#9#9#9'#EMPLEADO.FOTO8EMPLEADO3BASE64, #EMPLEADO.FOTO9EMPLE' +
              'ADO3BASE64,'#10#9#9#9'#EMPLEADO.FOTO10EMPLEADO3BASE64,#EMPLEADO.FOTO1EM' +
              'PLEADO4BASE64,'#10#9#9#9'#EMPLEADO.FOTO2EMPLEADO4BASE64, #EMPLEADO.FOTO' +
              '3EMPLEADO4BASE64, '#10#9#9#9'#EMPLEADO.FOTO4EMPLEADO4BASE64, #EMPLEADO.' +
              'FOTO5EMPLEADO4BASE64,'#10#9#9#9'#EMPLEADO.FOTO6EMPLEADO4BASE64, #EMPLEA' +
              'DO.FOTO7EMPLEADO4BASE64,'#10#9#9#9'#EMPLEADO.FOTO8EMPLEADO4BASE64, #EMP' +
              'LEADO.FOTO9EMPLEADO4BASE64,'#10#9#9#9'#EMPLEADO.FOTO10EMPLEADO4BASE64,#' +
              'EMPLEADO.FOTO1EMPLEADO5BASE64,'#10#9#9#9'#EMPLEADO.FOTO2EMPLEADO5BASE64' +
              ', #EMPLEADO.FOTO3EMPLEADO5BASE64, '#10#9#9#9'#EMPLEADO.FOTO4EMPLEADO5BA' +
              'SE64, #EMPLEADO.FOTO5EMPLEADO5BASE64,'#10#9#9#9'#EMPLEADO.FOTO6EMPLEADO' +
              '5BASE64, #EMPLEADO.FOTO7EMPLEADO5BASE64,'#10#9#9#9'#EMPLEADO.FOTO8EMPLE' +
              'ADO5BASE64, #EMPLEADO.FOTO9EMPLEADO5BASE64,'#10#9#9#9'#EMPLEADO.FOTO10E' +
              'MPLEADO5BASE64 FROM #EMPLEADO'#10'FOR XML RAW ('#39'SERVICES'#39'), ELEMENTS' +
              ')'#10#10'SELECT @XML AS XML'#10#10'DROP TABLE #EMPLEADO'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'XML'
                TableField = 'XML'
              end>
          end>
        Name = 'spObten5Empleados10Fotos'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <
          item
            Name = 'XML'
            DataType = datMemo
          end>
      end>
    JoinDataTables = <>
    UnionDataTables = <>
    Commands = <
      item
        Params = <
          item
            Name = 'UsuarioID'
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'FACTURAELECTRONICA'
            ConnectionType = 'SDAC'
            Default = True
            TargetTable = 'dbo.Acceso'
            SQL = 'DELETE'#10'FROM'#10'   Acceso'#10'WHERE'#10'   UsuarioID = :UsuarioID'
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'AccesosEliminar'
      end
      item
        Params = <
          item
            Name = 'OpcionID'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'UsuarioID'
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'FACTURAELECTRONICA'
            ConnectionType = 'SDAC'
            Default = True
            TargetTable = 'dbo.Acceso'
            SQL = 
              '  INSERT'#10'  INTO Acceso'#10'    (OpcionID, UsuarioID)'#10'  VALUES'#10'    (:' +
              'OpcionID, :UsuarioID)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'AccesosInsertar'
      end
      item
        Params = <
          item
            Name = 'OLD_ReporteID'
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'FACTURAELECTRONICA'
            ConnectionType = 'SDAC'
            Default = True
            TargetTable = 'dbo.Reporte'
            SQL = 
              'DELETE '#10'  FROM'#10'    dbo.Reporte'#10'  WHERE'#10'    (ReporteID = :OLD_Rep' +
              'orteID)'
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'Delete_dbo Reporte'
      end
      item
        Params = <
          item
            Name = 'ReporteID'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'Nombre'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'Tipo'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'Parametros'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'Template'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'TemplateMedia'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'TemplateBaja'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'TemplateExportar'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'SQL1'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'SQL2'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'CampoJoin'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'Usuarios'
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'FACTURAELECTRONICA'
            ConnectionType = 'SDAC'
            Default = True
            TargetTable = 'dbo.Reporte'
            SQL = 
              'INSERT'#10'  INTO dbo.Reporte'#10'    (ReporteID, Nombre, Tipo, Parametr' +
              'os, Template, TemplateMedia, '#10'     TemplateBaja, TemplateExporta' +
              'r, SQL1, SQL2, CampoJoin, Usuarios)'#10'  VALUES'#10'    (:ReporteID, :N' +
              'ombre, :Tipo, :Parametros, :Template, '#10'     :TemplateMedia, :Tem' +
              'plateBaja, :TemplateExportar, :SQL1, '#10'     :SQL2, :CampoJoin, :U' +
              'suarios)'
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'Insert_dbo Reporte'
      end
      item
        Params = <
          item
            Name = 'ReporteID'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'Nombre'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'Tipo'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'Parametros'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'Template'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'TemplateMedia'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'TemplateBaja'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'TemplateExportar'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'SQL1'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'SQL2'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'CampoJoin'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'Usuarios'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'OLD_ReporteID'
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'FACTURAELECTRONICA'
            ConnectionType = 'SDAC'
            Default = True
            TargetTable = 'dbo.Reporte'
            SQL = 
              'UPDATE dbo.Reporte'#10'  SET '#10'    ReporteID = :ReporteID, '#10'    Nombr' +
              'e = :Nombre, '#10'    Tipo = :Tipo, '#10'    Parametros = :Parametros, '#10 +
              '    Template = :Template, '#10'    TemplateMedia = :TemplateMedia, '#10 +
              '    TemplateBaja = :TemplateBaja, '#10'    TemplateExportar = :Templ' +
              'ateExportar, '#10'    SQL1 = :SQL1, '#10'    SQL2 = :SQL2, '#10'    CampoJoi' +
              'n = :CampoJoin,'#10'    Usuarios = :Usuarios'#10'  WHERE'#10'    (ReporteID ' +
              '= :OLD_ReporteID)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'Update_dbo Reporte'
      end
      item
        Params = <
          item
            Name = 'IDPROGRAMAMANTENIMIENTO'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'IDESTACION'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'FECHA'
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'BitacoraEstacionServ'
            ConnectionType = 'MSSQL'
            Default = True
            SQL = 
              'DECLARE @IDMANTENIMIENTOACTIVIDAD INT'#10'DECLARE @IDPROGRAMAMANTENI' +
              'MIENTO INT'#10'DECLARE @IDESTACION INT'#10'DECLARE @FECHA DATETIME'#10'DECLA' +
              'RE @PERIODICIDAD VARCHAR(30)'#10'DECLARE @CONT INT'#10#10'SET @IDPROGRAMAM' +
              'ANTENIMIENTO = :IDPROGRAMAMANTENIMIENTO'#10'SET @IDESTACION = :IDEST' +
              'ACION'#10'SET @FECHA = :FECHA'#10#10'SET @PERIODICIDAD = (SELECT PERIODICI' +
              'DAD FROM PROGRAMAMANTENIMIENTO WHERE IDPROGRAMAMANTENIMIENTO = @' +
              'IDPROGRAMAMANTENIMIENTO AND IDESTACION = @IDESTACION)'#10'/*SET @FEC' +
              'HA = (SELECT FECHAMANTENIMIENTO FROM PROGRAMAMANTENIMIENTO WHERE' +
              ' IDPROGRAMAMANTENIMIENTO = @IDPROGRAMAMANTENIMIENTO AND IDESTACI' +
              'ON = @IDESTACION)*/'#10'SET @IDMANTENIMIENTOACTIVIDAD = (SELECT ISNU' +
              'LL(MAX(IDMANTENIMIENTOACTIVIDAD),0)+1 FROM MANTENIMIENTOACTIVIDA' +
              'D)'#10#10'SET @CONT = (SELECT COUNT(*) AS RESULTADO FROM MANTENIMIENTO' +
              'ACTIVIDAD WHERE IDPROGRAMAMANTENIMIENTO = @IDPROGRAMAMANTENIMIEN' +
              'TO AND STATUS = '#39'PENDIENTE'#39')'#10#10'/*IF (@PERIODICIDAD = '#39'DIARIO'#39')'#10#9'S' +
              'ET @FECHA = DATEADD(day, 1, @FECHA)'#10#10'IF (@PERIODICIDAD = '#39'SEMANA' +
              'L'#39')'#10#9'SET @FECHA = DATEADD(day, 7, @FECHA)'#10#10'IF (@PERIODICIDAD = '#39 +
              'MENSUAL'#39')'#10#9'SET @FECHA = DATEADD(month, 1, @FECHA)'#10#10'IF (@PERIODIC' +
              'IDAD = '#39'TRIMESTRAL'#39')'#10#9'SET @FECHA = DATEADD(month, 3, @FECHA)'#10#10'IF' +
              ' (@PERIODICIDAD = '#39'CUATRIMESTRAL'#39')'#10#9'SET @FECHA = DATEADD(month, ' +
              '4, @FECHA)'#10#10'IF (@PERIODICIDAD = '#39'SEMESTRAL'#39')'#10#9'SET @FECHA = DATEA' +
              'DD(month, 6, @FECHA)'#10#10'IF (@PERIODICIDAD = '#39'ANUAL'#39')'#10#9'SET @FECHA =' +
              ' DATEADD(month, 12, @FECHA)*/'#10'IF @CONT = 0'#10'BEGIN'#10'INSERT INTO MAN' +
              'TENIMIENTOACTIVIDAD'#10'SELECT @IDMANTENIMIENTOACTIVIDAD, @IDPROGRAM' +
              'AMANTENIMIENTO, @FECHA, '#39'PENDIENTE'#39', '#39#39#10'END'
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'cmdProgramaMantenimiento'
      end>
    RelationShips = <
      item
        Name = 'FK_spValidaUsuario_spValidaUsuario'
        MasterDatasetName = 'spValidaUsuario'
        DetailDatasetName = 'spValidaUsuario'
        RelationshipType = rtForeignKey
      end
      item
        Name = 'FK_dbo.Reporte_dbo.Reporte'
        MasterDatasetName = 'dbo.Reporte'
        DetailDatasetName = 'dbo.Reporte'
        RelationshipType = rtForeignKey
      end
      item
        Name = 'FK_dbo.BITACORAESTACION_dbo.BITACORAESTACION'
        MasterDatasetName = 'dbo.BITACORAESTACION'
        DetailDatasetName = 'dbo.BITACORAESTACION'
        RelationshipType = rtForeignKey
      end
      item
        Name = 'FK_spObtenIDEmpleado_spObtenIDEmpleado'
        RelationshipType = rtForeignKey
      end>
    UpdateRules = <>
    Version = 0
    Left = 24
    Top = 72
  end
  object dbpUsuario: TDABusinessProcessor
    Schema = Schema
    InsertCommandName = 'Insert_dbo Usuario'
    DeleteCommandName = 'Delete_dbo Usuario'
    UpdateCommandName = 'Update_dbo Usuario'
    ReferencedDataset = 'dbo Usuario'
    ProcessorOptions = [poAutoGenerateRefreshDataset]
    UpdateMode = updWhereKeyOnly
    Left = 128
    Top = 24
  end
  object bpReporte: TDABusinessProcessor
    Schema = Schema
    InsertCommandName = 'Insert_dbo Reporte'
    DeleteCommandName = 'Delete_dbo Reporte'
    UpdateCommandName = 'Update_dbo Reporte'
    ReferencedDataset = 'dbo Reporte'
    ProcessorOptions = []
    UpdateMode = updWhereKeyOnly
    RaiseExceptionAtError = True
    Left = 128
    Top = 78
  end
  object DataStreamer: TDABin2DataStreamer
    Left = 24
    Top = 16
  end
  object dbpDetalleLiquidacion: TDABusinessProcessor
    Schema = Schema
    InsertCommandName = 'Insert_dbo DetalleLiquidacion2'
    DeleteCommandName = 'Delete_dbo DetalleLiquidacion2'
    UpdateCommandName = 'Update_dbo DetalleLiquidacion2'
    ReferencedDataset = 'LIQDetalleLiquidacion2'
    ProcessorOptions = [poAutoGenerateRefreshDataset]
    UpdateMode = updWhereKeyOnly
    Left = 128
    Top = 128
  end
  object dbpLiquidacion: TDABusinessProcessor
    Schema = Schema
    InsertCommandName = 'Insert_dbo Liquidacion2'
    DeleteCommandName = 'Delete_dbo Liquidacion2'
    UpdateCommandName = 'Update_dbo Liquidacion2'
    ReferencedDataset = 'LIQLiquidacion2'
    ProcessorOptions = [poAutoGenerateRefreshDataset]
    UpdateMode = updWhereKeyOnly
    Left = 256
    Top = 16
  end
end