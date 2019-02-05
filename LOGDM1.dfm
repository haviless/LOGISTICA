object DMLOG: TDMLOG
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 199
  Top = 193
  Height = 523
  Width = 1031
  object dsArti: TwwDataSource
    DataSet = cdsArti
    Left = 60
    Top = 8
  end
  object cdsCCost: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCCost'
    RemoteServer = DCOM1
    PictureMasks.Strings = (
      'CCOSID'#9'###'#9'T'#9'T')
    ValidateWithMask = True
    Left = 229
    Top = 1
  end
  object dsCCost: TwwDataSource
    DataSet = cdsCCost
    Left = 229
    Top = 8
  end
  object cdsCIA: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCIA'
    RemoteServer = DCOM1
    PictureMasks.Strings = (
      'CIAID'#9'##'#9'T'#9'T')
    ValidateWithMask = True
    Left = 176
    Top = 1
  end
  object dsCIA: TwwDataSource
    DataSet = cdsCIA
    Left = 176
    Top = 16
  end
  object cdsGArti: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvGArti'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 333
    Top = 56
  end
  object dsGArti: TwwDataSource
    DataSet = cdsGArti
    Left = 337
    Top = 65
  end
  object dsReqs: TwwDataSource
    DataSet = cdsReqs
    Left = 281
    Top = 11
  end
  object cdsUMed: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvUMed'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 118
    Top = 56
  end
  object dsUMed: TwwDataSource
    DataSet = cdsUMed
    Left = 122
    Top = 65
  end
  object cdsUsers: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvUsers'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 229
    Top = 56
  end
  object dsUsers: TwwDataSource
    DataSet = cdsUsers
    Left = 233
    Top = 65
  end
  object cdsTMoneda: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTMoneda'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 176
    Top = 56
  end
  object dsTMoneda: TwwDataSource
    DataSet = cdsTMoneda
    Left = 180
    Top = 65
  end
  object cdsSQL: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSQL'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 281
    Top = 56
  end
  object dsSQL: TwwDataSource
    DataSet = cdsSQL
    Left = 285
    Top = 65
  end
  object cdsSolCot: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSolCot'
    RemoteServer = DCOM1
    OnReconcileError = cdsReqsReconcileError
    ValidateWithMask = True
    Left = 389
    Top = 1
  end
  object dsSolCot: TwwDataSource
    DataSet = cdsSolCot
    Left = 389
    Top = 8
  end
  object cdsLEntrega: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvLEntrega'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 452
    Top = 1
  end
  object dsLEntrega: TwwDataSource
    DataSet = cdsLEntrega
    Left = 452
    Top = 8
  end
  object dsFPago: TwwDataSource
    DataSet = cdsFPago
    Left = 511
    Top = 8
  end
  object cdsTSolCot: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTSolCot'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 511
    Top = 56
  end
  object dsTSolCot: TwwDataSource
    DataSet = cdsTSolCot
    Left = 515
    Top = 65
  end
  object cdsRqsArtX: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvRqsArtX'
    RemoteServer = DCOM1
    OnCalcFields = cdsRqsArtXCalcFields
    ValidateWithMask = True
    Left = 60
    Top = 110
  end
  object dsRqsArtX: TwwDataSource
    DataSet = cdsRqsArtX
    Left = 60
    Top = 128
  end
  object cdsDSCxDRQS: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDSCxDRQS'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 118
    Top = 110
  end
  object dsDSCxDRQS: TwwDataSource
    DataSet = cdsDSCxDRQS
    Left = 118
    Top = 128
  end
  object cdsTRqs: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTRqs'
    RemoteServer = DCOM1
    PictureMasks.Strings = (
      'TRQSID'#9'###'#9'T'#9'T')
    ValidateWithMask = True
    Left = 176
    Top = 110
  end
  object dsTRqs: TwwDataSource
    DataSet = cdsTRqs
    Left = 176
    Top = 128
  end
  object cdsArtPendX: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvArtPendX'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 7
    Top = 110
  end
  object dsArtPendX: TwwDataSource
    DataSet = cdsArtPendX
    Left = 7
    Top = 128
  end
  object cdsQry: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 229
    Top = 110
  end
  object dsQry: TwwDataSource
    DataSet = cdsQry
    Left = 229
    Top = 128
  end
  object cdsFPago: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvFPago'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 511
    Top = 1
  end
  object cdsMedCom: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvMedCom'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 389
    Top = 110
  end
  object dsMedCom: TwwDataSource
    DataSet = cdsMedCom
    Left = 389
    Top = 128
  end
  object cdsSCxProv: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSCxProv'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 333
    Top = 110
  end
  object dsSCxProv: TwwDataSource
    DataSet = cdsSCxProv
    Left = 333
    Top = 128
  end
  object cdsSolxCIA: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSolCot'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 7
    Top = 177
  end
  object dsSolxCIA: TwwDataSource
    DataSet = cdsSolxCIA
    Left = 7
    Top = 186
  end
  object cdsOrdComp: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvOrdComp'
    RemoteServer = DCOM1
    OnReconcileError = cdsReqsReconcileError
    ControlType.Strings = (
      'FLAGVAR;CheckBox;X;0')
    ValidateWithMask = True
    Left = 60
    Top = 177
  end
  object dsOrdComp: TwwDataSource
    DataSet = cdsOrdComp
    Left = 60
    Top = 186
  end
  object cdsDOrdComp: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDOrdComp'
    RemoteServer = DCOM1
    OnReconcileError = cdsReqsReconcileError
    ValidateWithMask = True
    Left = 118
    Top = 177
  end
  object dsDOrdComp: TwwDataSource
    DataSet = cdsDOrdComp
    Left = 118
    Top = 186
  end
  object cdsProfxCIA: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvProfxCia'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 176
    Top = 177
  end
  object dsProfxCIA: TwwDataSource
    DataSet = cdsProfxCIA
    Left = 176
    Top = 186
  end
  object cdsDProfxCIA: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDProfxCia'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 229
    Top = 177
  end
  object dsDProfxCIA: TwwDataSource
    DataSet = cdsDProfxCIA
    Left = 229
    Top = 186
  end
  object cdsPxAxR: TwwClientDataSet
    Aggregates = <>
    Filtered = True
    FieldDefs = <
      item
        Name = 'CIAID'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'RQSID'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'DRQSID'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'ARTID'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'DRQSCNSG'
        DataType = ftFloat
      end
      item
        Name = 'DRQSCNSU'
        DataType = ftFloat
      end
      item
        Name = 'DRQSCNAG'
        DataType = ftFloat
      end
      item
        Name = 'DRQSCNAU'
        DataType = ftFloat
      end
      item
        Name = 'UNMIDG'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'UNMIDU'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'RQSFREG'
        DataType = ftDate
      end
      item
        Name = 'RQSEST'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'RQSFATE'
        DataType = ftDate
      end
      item
        Name = 'TRQSID'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ODCID'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'RQSMARK'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'PRIOID'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'LOCID'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ALMID'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'SCCID'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'RQSFLAGUM'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DRQSCNTS'
        DataType = ftFloat
      end
      item
        Name = 'DRQSCNTA'
        DataType = ftFloat
      end
      item
        Name = 'RXASALDO'
        DataType = ftFloat
      end
      item
        Name = 'UNMID'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    Params = <>
    ProviderName = 'prvDReqs'
    RemoteServer = DCOM1
    StoreDefs = True
    OnCalcFields = cdsPxAxRCalcFields
    ValidateWithMask = True
    Left = 281
    Top = 177
  end
  object dsPxAxR: TwwDataSource
    DataSet = cdsPxAxR
    Left = 281
    Top = 186
  end
  object cdsFAB: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvFab'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 333
    Top = 177
  end
  object dsFAB: TwwDataSource
    DataSet = cdsFAB
    Left = 333
    Top = 186
  end
  object dsEARTI: TwwDataSource
    DataSet = cdsEARTI
    Left = 384
    Top = 186
  end
  object cdsClnArti: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvArti'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 118
    Top = 1
  end
  object dsClnArti: TwwDataSource
    DataSet = cdsClnArti
    Left = 118
    Top = 8
  end
  object cdsQARTI: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvQArti'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 437
    Top = 177
  end
  object dsQARTI: TwwDataSource
    DataSet = cdsQARTI
    Left = 437
    Top = 186
  end
  object cdsNIS: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvNISA'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 490
    Top = 177
  end
  object dsNIS: TwwDataSource
    DataSet = cdsNIS
    Left = 490
    Top = 186
  end
  object cdsALM: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvALM'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 10
    Top = 231
  end
  object dsALM: TwwDataSource
    DataSet = cdsALM
    Left = 10
    Top = 239
  end
  object cdsTDOC: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTDOC'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 68
    Top = 231
  end
  object dsTDOC: TwwDataSource
    DataSet = cdsTDOC
    Left = 68
    Top = 239
  end
  object cdsTRAN: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTRAN'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 142
    Top = 469
  end
  object dsTRAN: TwwDataSource
    DataSet = cdsTRAN
    Left = 150
    Top = 480
  end
  object cdsSTK: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSTK'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 231
    Top = 231
  end
  object dsSTK: TwwDataSource
    DataSet = cdsSTK
    Left = 231
    Top = 239
  end
  object cdsCNS: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCNS'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 283
    Top = 231
  end
  object dsCNS: TwwDataSource
    DataSet = cdsCNS
    Left = 283
    Top = 239
  end
  object cdsEUNMED: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSEQMED'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 339
    Top = 231
  end
  object dsEUNMED: TwwDataSource
    DataSet = cdsEUNMED
    Left = 339
    Top = 239
  end
  object cdsNIA: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvNISA'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 402
    Top = 231
  end
  object dsNIA: TwwDataSource
    DataSet = cdsNIA
    Left = 402
    Top = 239
  end
  object cdsTDNISA: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTDNISA'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 179
    Top = 231
  end
  object dsTDNISA: TwwDataSource
    DataSet = cdsTDNISA
    Left = 179
    Top = 239
  end
  object cdsOCNIA: TwwClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CIAID'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ALMID'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'TDAID'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ODCID'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ODCFEOC'
        DataType = ftDate
      end
      item
        Name = 'NISAID'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'FPAGOID'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ODCTOTALG'
        DataType = ftFloat
      end
      item
        Name = 'PROV'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'LOCID'
        DataType = ftString
        Size = 2
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'prvOCNIA'
    RemoteServer = DCOM1
    StoreDefs = True
    ValidateWithMask = True
    Left = 522
    Top = 231
  end
  object dsOCNIA: TwwDataSource
    DataSet = cdsOCNIA
    Left = 522
    Top = 239
  end
  object cdsLKTRAN: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTRAN'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 572
    Top = 56
  end
  object dsLKTRAN: TwwDataSource
    DataSet = cdsLKTRAN
    Left = 576
    Top = 65
  end
  object cdsPRIO: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvPRIO'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 572
    Top = 1
  end
  object dsPRIO: TwwDataSource
    DataSet = cdsPRIO
    Left = 572
    Top = 8
  end
  object dsAPNIS: TwwDataSource
    DataSet = cdsAPNIS
    Left = 572
    Top = 128
  end
  object cdsAPNIS: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvAPNIS'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 572
    Top = 110
  end
  object cdsArti: TwwClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    ProviderName = 'prvArti'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 76
    Top = 1
  end
  object cdsEARTI: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvEArti'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 384
    Top = 177
  end
  object cdsReqs: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvReqs'
    RemoteServer = DCOM1
    OnReconcileError = cdsReqsReconcileError
    ControlType.Strings = (
      'FLAGVAR;CheckBox;*;')
    ValidateWithMask = True
    Left = 281
    Top = 1
  end
  object cdsLOC: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvLOC'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 60
    Top = 56
  end
  object dsLOC: TwwDataSource
    DataSet = cdsLOC
    Left = 64
    Top = 65
  end
  object cdsKDXTemp: TwwClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'KDXID'
        DataType = ftFloat
      end
      item
        Name = 'CIAID'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'LOCID'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ALMID'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ARTFUC'
        DataType = ftDate
      end
      item
        Name = 'TDAID'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'TDAABR'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ARTID'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ARTDES'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'UNMIDG'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'UMEDGDES'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'UNMIDU'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'UMEDUDES'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NISAID'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NISATIP'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'KDXCNTG'
        DataType = ftFloat
      end
      item
        Name = 'KDXCNTU'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'prvKDXTemp'
    RemoteServer = DCOM1
    StoreDefs = True
    ValidateWithMask = True
    Left = 461
    Top = 284
  end
  object dsKDXTemp: TwwDataSource
    DataSet = cdsKDXTemp
    Left = 461
    Top = 301
  end
  object cdsObra: TwwClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'OBRAID'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'OBRADES'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'OBRAABR'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'OBRARESP'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'OBRANUM'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'OBRAFCHA'
        DataType = ftDate
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'prvObra'
    RemoteServer = DCOM1
    StoreDefs = True
    ValidateWithMask = True
    Left = 461
    Top = 231
  end
  object dsObra: TwwDataSource
    DataSet = cdsObra
    Left = 461
    Top = 239
  end
  object cdsUsuarios: TwwClientDataSet
    Aggregates = <>
    IndexFieldNames = 'USERID'
    Params = <>
    ProviderName = 'dspUsuarios'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 413
    Top = 608
  end
  object cdsMGrupo: TwwClientDataSet
    Aggregates = <>
    IndexFieldNames = 'GRUPOID'
    Params = <>
    ProviderName = 'dspMGrupo'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 10
    Top = 286
  end
  object cdsGrupos: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGrupos'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 68
    Top = 286
  end
  object cdsAcceso: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAcceso'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 474
    Top = 608
  end
  object dsUsuarios: TwwDataSource
    DataSet = cdsUsuarios
    Left = 408
    Top = 624
  end
  object dsMGrupo: TwwDataSource
    DataSet = cdsMGrupo
    Left = 10
    Top = 302
  end
  object dsGrupos: TwwDataSource
    DataSet = cdsGrupos
    Left = 68
    Top = 302
  end
  object dsAcceso: TwwDataSource
    DataSet = cdsAcceso
    Left = 472
    Top = 624
  end
  object cdsProforma: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvProforma'
    RemoteServer = DCOM1
    OnReconcileError = cdsReqsReconcileError
    PictureMasks.Strings = (
      'PROFTOTALG'#9'*12[#][.*4[#]]'#9'T'#9'F'
      'PROFIXTCC'#9'*12[#][.*4[#]]'#9'T'#9'F'
      'PROFTTIMPU'#9'*12[#][.*4[#]]'#9'T'#9'F')
    ValidateWithMask = True
    Left = 452
    Top = 110
  end
  object dsProforma: TwwDataSource
    DataSet = cdsProforma
    Left = 452
    Top = 128
  end
  object cdsTASAS: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTASAS'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 179
    Top = 286
  end
  object dsTASAS: TwwDataSource
    DataSet = cdsTASAS
    Left = 179
    Top = 302
  end
  object cdsTIPCAM: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTIPCAM'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 231
    Top = 286
  end
  object dsTIPCAM: TwwDataSource
    DataSet = cdsTIPCAM
    Left = 231
    Top = 302
  end
  object dsDReqs: TwwDataSource
    DataSet = cdsDReqs
    Left = 333
    Top = 8
  end
  object cdsDReqs: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDReqs'
    RemoteServer = DCOM1
    OnReconcileError = cdsReqsReconcileError
    ValidateWithMask = True
    Left = 333
    Top = 1
  end
  object cdsDSolCot: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDSolCot'
    RemoteServer = DCOM1
    OnReconcileError = cdsReqsReconcileError
    ValidateWithMask = True
    Left = 389
    Top = 56
  end
  object dsDSolCot: TwwDataSource
    DataSet = cdsDSolCot
    Left = 393
    Top = 65
  end
  object cdsDProforma: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDProforma'
    RemoteServer = DCOM1
    OnReconcileError = cdsReqsReconcileError
    ValidateWithMask = True
    Left = 511
    Top = 110
  end
  object dsDProforma: TwwDataSource
    DataSet = cdsDProforma
    Left = 511
    Top = 128
  end
  object cdsMovCxP: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMovCxP'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 283
    Top = 286
  end
  object dsMovCxP: TwwDataSource
    DataSet = cdsMovCxP
    Left = 283
    Top = 302
  end
  object cdsDetCxP: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDetCxP'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 592
    Top = 284
  end
  object dsDetCxP: TwwDataSource
    DataSet = cdsDetCxP
    Left = 592
    Top = 301
  end
  object cdsComprador: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvComprador'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 452
    Top = 56
  end
  object dsComprador: TwwDataSource
    DataSet = cdsComprador
    Left = 456
    Top = 65
  end
  object cdsKDX: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvKDX'
    RemoteServer = DCOM1
    ControlType.Strings = (
      'FLAGVAR;CheckBox;*; ')
    ValidateWithMask = True
    Left = 9
    Top = 351
  end
  object dsKDX: TwwDataSource
    DataSet = cdsKDX
    Left = 9
    Top = 361
  end
  object cdsProv: TwwClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    ProviderName = 'prvProv'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 281
    Top = 110
  end
  object dsProv: TwwDataSource
    DataSet = cdsProv
    Left = 281
    Top = 128
  end
  object cdsArtPend: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvArtPend'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 339
    Top = 286
  end
  object dsArtPend: TwwDataSource
    DataSet = cdsArtPend
    Left = 339
    Top = 302
  end
  object cdsRqsArt: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvRqsArt'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 13
    Top = 56
  end
  object dsRqsArt: TwwDataSource
    DataSet = cdsRqsArt
    Left = 11
    Top = 65
  end
  object cdsGrab: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvGrab'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 591
    Top = 532
  end
  object cdsEval: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvEval'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 339
    Top = 284
  end
  object dsEval: TwwDataSource
    DataSet = cdsEval
    Left = 339
    Top = 301
  end
  object cdsConCom: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvConCom'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 461
    Top = 286
  end
  object dsConCom: TwwDataSource
    DataSet = cdsConCom
    Left = 461
    Top = 302
  end
  object cdsTotEval: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTotEval'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 522
    Top = 286
  end
  object dsTotEval: TwwDataSource
    DataSet = cdsTotEval
    Left = 522
    Top = 302
  end
  object cdsMotivos: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvMotivos'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 699
    Top = 1
  end
  object dsMotivos: TwwDataSource
    DataSet = cdsMotivos
    Left = 699
    Top = 8
  end
  object cdsEvalRep: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvEvalRep'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 592
    Top = 286
  end
  object dsEvalRep: TwwDataSource
    DataSet = cdsEvalRep
    Left = 592
    Top = 302
  end
  object cdsFAM: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvFAM'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 592
    Top = 231
  end
  object dsFAM: TwwDataSource
    DataSet = cdsFAM
    Left = 592
    Top = 239
  end
  object cdsSUBFAM: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSUBFAM'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 633
    Top = 179
  end
  object dsSUBFAM: TwwDataSource
    DataSet = cdsSUBFAM
    Left = 634
    Top = 186
  end
  object cdsTINID: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTINID'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 627
    Top = 110
  end
  object dsTINID: TwwDataSource
    DataSet = cdsTINID
    Left = 627
    Top = 128
  end
  object cdsPCUENTA: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvPCUENTA'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 642
    Top = 56
  end
  object dsPCUENTA: TwwDataSource
    DataSet = cdsPCUENTA
    Left = 646
    Top = 65
  end
  object cdsParaRepo: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvParaRepo'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 642
    Top = 1
  end
  object dsParaRepo: TwwDataSource
    DataSet = cdsParaRepo
    Left = 642
    Top = 8
  end
  object cdsTipSol: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTipSol'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 522
    Top = 284
  end
  object dsTipSol: TwwDataSource
    DataSet = cdsTipSol
    Left = 522
    Top = 301
  end
  object cdsCondComercial: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCondComercial'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 551
    Top = 177
  end
  object dsCondComercial: TwwDataSource
    DataSet = cdsCondComercial
    Left = 551
    Top = 186
  end
  object cdsSerPend: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSerPend'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 402
    Top = 284
  end
  object dsSerPend: TwwDataSource
    DataSet = cdsSerPend
    Left = 402
    Top = 301
  end
  object cdsPais: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPais'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 399
    Top = 409
  end
  object dsPais: TwwDataSource
    DataSet = cdsPais
    Left = 407
    Top = 422
  end
  object cdsDpto: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDpto'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 663
    Top = 409
  end
  object dsDpto: TwwDataSource
    DataSet = cdsDpto
    Left = 666
    Top = 422
  end
  object cdsProvinc: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProvinc'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 68
    Top = 284
  end
  object dsProvinc: TwwDataSource
    DataSet = cdsProvinc
    Left = 68
    Top = 301
  end
  object cdsDistrito: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDistrito'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 126
    Top = 286
  end
  object dsDistrito: TwwDataSource
    DataSet = cdsDistrito
    Left = 126
    Top = 295
  end
  object cdsSecEco: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSecEco'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 179
    Top = 284
  end
  object dsSecEco: TwwDataSource
    DataSet = cdsSecEco
    Left = 179
    Top = 301
  end
  object cdsGiro: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGiro'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 231
    Top = 284
  end
  object dsGiro: TwwDataSource
    DataSet = cdsGiro
    Left = 231
    Top = 301
  end
  object cdsClasif: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClasif'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 602
    Top = 409
  end
  object dsClasif: TwwDataSource
    DataSet = cdsClasif
    Left = 610
    Top = 422
  end
  object cdsClAux: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClAux'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 699
    Top = 56
  end
  object dsClAux: TwwDataSource
    DataSet = cdsClAux
    Left = 703
    Top = 65
  end
  object cdsTipProv: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTipProv'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 685
    Top = 110
  end
  object dsTipProv: TwwDataSource
    DataSet = cdsTipProv
    Left = 687
    Top = 128
  end
  object cdsReporte: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvReporte'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 695
    Top = 177
  end
  object dsReporte: TwwDataSource
    DataSet = cdsReporte
    Left = 695
    Top = 188
  end
  object cdsMTipProv: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvMTipProv'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 655
    Top = 232
  end
  object dsMTipProv: TwwDataSource
    DataSet = cdsMTipProv
    Left = 661
    Top = 239
  end
  object cdsFAsig: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSQL'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 717
    Top = 232
  end
  object dsFAsig: TwwDataSource
    DataSet = cdsFAsig
    Left = 724
    Top = 246
  end
  object cdsArtPendXTot: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvArtPendXTot'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 770
    Top = 1
  end
  object dsArtPendXTot: TwwDataSource
    DataSet = cdsArtPendXTot
    Left = 770
    Top = 8
  end
  object cdsRqsArtXTot: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvRqsArtXTot'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 207
    Top = 469
  end
  object dsRqsArtXTot: TwwDataSource
    DataSet = cdsRqsArtXTot
    Left = 219
    Top = 480
  end
  object cdsConsumo: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvConsumo'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 748
    Top = 112
  end
  object dsConsumo: TwwDataSource
    DataSet = cdsConsumo
    Left = 748
    Top = 121
  end
  object cdsDODCxDRQS: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDODCxDRQS'
    RemoteServer = DCOM1
    OnReconcileError = cdsDODCxDRQSReconcileError
    ValidateWithMask = True
    Left = 591
    Top = 469
  end
  object dsDODCxDRQS: TwwDataSource
    DataSet = cdsDODCxDRQS
    Left = 597
    Top = 480
  end
  object cdsDetMov: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDetMov'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 725
    Top = 286
  end
  object dsDetMov: TwwDataSource
    DataSet = cdsDetMov
    Left = 725
    Top = 302
  end
  object cdsLOG: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvLOG'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 462
    Top = 353
  end
  object cdsPeriodo: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvPeriodo'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 659
    Top = 286
  end
  object dsPeriodo: TwwDataSource
    DataSet = cdsPeriodo
    Left = 659
    Top = 301
  end
  object cdsTipPre: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTipPre'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 787
    Top = 352
  end
  object cdsParPre: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvParPre'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 129
    Top = 231
  end
  object cdsCabPre: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCabPre'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 78
    Top = 469
  end
  object cdsDetPre: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDetPre'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 774
    Top = 232
  end
  object dsParPre: TwwDataSource
    DataSet = cdsParPre
    Left = 126
    Top = 238
  end
  object dsCabPre: TwwDataSource
    DataSet = cdsCabPre
    Left = 84
    Top = 480
  end
  object dsTipPre: TwwDataSource
    DataSet = cdsTipPre
    Left = 794
    Top = 361
  end
  object dsDetPre: TwwDataSource
    DataSet = cdsDetPre
    Left = 782
    Top = 240
  end
  object cdsNivelPresu: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvNivelPresu'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 719
    Top = 349
  end
  object dsNivelPresu: TwwDataSource
    DataSet = cdsNivelPresu
    Left = 720
    Top = 361
  end
  object cdsProfxEval: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvProfxEval'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 247
    Top = 532
  end
  object dsProfxEval: TwwDataSource
    DataSet = cdsProfxEval
    Left = 755
    Top = 177
  end
  object cdsValEva: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvValEva'
    RemoteServer = DCOM1
    ControlType.Strings = (
      'VALOR;CustomEdit;dbeValor')
    ValidateWithMask = True
    Left = 743
    Top = 57
  end
  object dsValEva: TwwDataSource
    DataSet = cdsValEva
    Left = 752
    Top = 64
  end
  object cdsEvalResul: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvEvaResul'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 790
    Top = 286
  end
  object dsEvalResul: TwwDataSource
    DataSet = cdsEvalResul
    Left = 798
    Top = 304
  end
  object dsLOG: TwwDataSource
    DataSet = cdsLOG
    Left = 468
    Top = 361
  end
  object cdsRegEval: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvRegEval'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 69
    Top = 409
  end
  object dsRegEval: TwwDataSource
    DataSet = cdsRegEval
    Left = 72
    Top = 422
  end
  object cdsReqAut: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvreqAut'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 336
    Top = 409
  end
  object dsReqAut: TwwDataSource
    DataSet = cdsReqAut
    Left = 340
    Top = 422
  end
  object cdsPedUsu: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvPedUsu'
    RemoteServer = DCOM1
    OnReconcileError = cdsReqsReconcileError
    ValidateWithMask = True
    Left = 781
    Top = 409
  end
  object dsPedUsu: TwwDataSource
    DataSet = cdsPedUsu
    Left = 789
    Top = 422
  end
  object cdsDPedUsu: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDPedUsu'
    RemoteServer = DCOM1
    OnReconcileError = cdsReqsReconcileError
    ControlType.Strings = (
      'FLAGVAR;CheckBox;S;N')
    ValidateWithMask = True
    Left = 402
    Top = 286
  end
  object dsDPedUsu: TwwDataSource
    DataSet = cdsDPedUsu
    Left = 406
    Top = 296
  end
  object cdsTipPer: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTipPer'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 340
    Top = 469
  end
  object dsTipPer: TwwDataSource
    DataSet = cdsTipPer
    Left = 345
    Top = 480
  end
  object dsNegociacion: TwwDataSource
    DataSet = cdsNegociacion
    Left = 204
    Top = 422
  end
  object cdsNegociacion: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvNegociacion'
    RemoteServer = DCOM1
    OnReconcileError = cdsReqsReconcileError
    ValidateWithMask = True
    Left = 200
    Top = 409
  end
  object cdsResultSet: TwwClientDataSet
    Aggregates = <>
    Params = <>
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 23
    Top = 532
  end
  object cdsDeltaSet: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ValidateWithMask = True
    Left = 10
    Top = 409
  end
  object dsDeltaSet: TwwDataSource
    DataSet = cdsDeltaSet
    Left = 10
    Top = 422
  end
  object cdsDHojaT: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDHojat'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 130
    Top = 409
  end
  object dsDHojaT: TwwDataSource
    DataSet = cdsDHojaT
    Left = 130
    Top = 422
  end
  object cdsMovFac: TwwClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'dspMovFac'
    RemoteServer = DCOM1
    PictureMasks.Strings = (
      'PEDTCAM'#9'#[*#][.[#][#][#][#]]'#9'T'#9'F'
      'PEDGARAN'#9'[#][#][#]'#9'T'#9'F'
      'PEDEMBMO'#9'#[*#][.[#][#][#]]'#9'T'#9'F')
    ValidateWithMask = True
    Left = 284
    Top = 469
  end
  object dsMovFac: TwwDataSource
    DataSet = cdsMovFac
    Left = 284
    Top = 480
  end
  object dsDetFac: TwwDataSource
    AutoEdit = False
    DataSet = cdsDetFac
    Left = 545
    Top = 422
  end
  object cdsDetFac: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDetFac'
    RemoteServer = DCOM1
    OnReconcileError = cdsReqsReconcileError
    ValidateWithMask = True
    Left = 537
    Top = 409
  end
  object cdsHojaT: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspHojaT'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 527
    Top = 469
  end
  object dsHojaT: TwwDataSource
    DataSet = cdsHojaT
    Left = 527
    Top = 480
  end
  object cdsCComer: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCComer'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 311
    Top = 532
  end
  object cdsQry1: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTge'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 525
    Top = 349
  end
  object cdsSolu: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSolu'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 794
    Top = 469
  end
  object dsSolu: TwwDataSource
    DataSet = cdsSolu
    Left = 794
    Top = 480
  end
  object cdsQry3: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvEjecuta'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 675
    Top = 469
  end
  object dsQry3: TwwDataSource
    DataSet = cdsQry3
    Left = 677
    Top = 480
  end
  object cdsTReg: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTReg'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 191
    Top = 532
  end
  object cdsUltTGE: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTge'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 139
    Top = 532
  end
  object dsTLPrecio: TwwDataSource
    DataSet = cdsTLista
    Left = 737
    Top = 480
  end
  object cdsTLPrecio: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTLPrecio'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 732
    Top = 469
  end
  object dsDireccion: TwwDataSource
    DataSet = cdsDireccion
    Left = 131
    Top = 361
  end
  object cdsDireccion: TwwClientDataSet
    Aggregates = <>
    PacketRecords = 100
    Params = <>
    ProviderName = 'dspDireccion'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 120
    Top = 351
  end
  object dsDscto: TwwDataSource
    DataSet = cdsDscto
    Left = 338
    Top = 361
  end
  object cdsDscto: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDscto'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 338
    Top = 351
  end
  object cdsQry4: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvEjecuta'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 195
    Top = 351
  end
  object dsQry4: TwwDataSource
    DataSet = cdsQry4
    Left = 192
    Top = 361
  end
  object cdsQry6: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTge'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 291
    Top = 351
  end
  object dsQry6: TwwDataSource
    DataSet = cdsQry6
    Left = 291
    Top = 361
  end
  object cdsDRComp: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDRComp'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 79
    Top = 532
  end
  object dsVen: TwwDataSource
    DataSet = cdsVen
    Left = 661
    Top = 361
  end
  object cdsVen: TwwClientDataSet
    Aggregates = <>
    IndexFieldNames = 'VEID'
    Params = <>
    ProviderName = 'dspVen'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 659
    Top = 348
  end
  object dsTVta: TwwDataSource
    DataSet = cdsTVta
    Left = 600
    Top = 361
  end
  object cdsTVta: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTVta'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 595
    Top = 348
  end
  object cdsEmpresa: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmpresa'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 375
    Top = 532
  end
  object cdsTLista: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTLista'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 439
    Top = 532
  end
  object dsClie: TwwDataSource
    DataSet = cdsClie
    Left = 399
    Top = 361
  end
  object cdsClie: TwwClientDataSet
    Aggregates = <>
    IndexFieldNames = 'CLIEID'
    PacketRecords = 50
    Params = <>
    ProviderName = 'dspClie'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 398
    Top = 353
  end
  object dsDiasGracia: TwwDataSource
    DataSet = cdsDiasGracia
    Left = 477
    Top = 422
  end
  object cdsDiasGracia: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTge'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 466
    Top = 409
  end
  object cdsQry7: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTge'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 472
    Top = 469
  end
  object dsQry7: TwwDataSource
    DataSet = cdsQry7
    Left = 472
    Top = 480
  end
  object cdsQry2: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTge'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 487
    Top = 532
  end
  object cdsQry5: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvEjecuta'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 243
    Top = 351
  end
  object dsQry5: TwwDataSource
    DataSet = cdsQry5
    Left = 243
    Top = 361
  end
  object dsLPrecio: TwwDataSource
    DataSet = cdsLPrecio
    Left = 725
    Top = 422
  end
  object cdsLPrecio: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLPrecio'
    RemoteServer = DCOM1
    OnReconcileError = cdsReqsReconcileError
    PictureMasks.Strings = (
      'LPRETCAM'#9'#[*#][.[#][#][#]]'#9'T'#9'F'
      'LPREVOLMIN'#9'#[*#][.[#][#][#]]'#9'T'#9'F'
      'LPREPDCTO'#9'#[*#][.[#][#][#]]'#9'T'#9'F'
      'LPREPRECMO'#9'#[*#][.[#][#][#]]'#9'T'#9'F'
      'LPREPINC'#9'#[*#][.[#][#][#]]'#9'T'#9'F'
      'LPREBASEMO'#9'#[*#][.[#][#][#]]'#9'T'#9'F')
    ValidateWithMask = True
    Left = 717
    Top = 409
  end
  object cdsLinea: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLinea'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 793
    Top = 533
  end
  object dsLinea: TwwDataSource
    DataSet = cdsLinea
    Left = 793
    Top = 543
  end
  object cdsTTran: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTTran'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 535
    Top = 532
  end
  object cdsCanal: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCanal'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 272
    Top = 409
  end
  object dsCanal: TwwDataSource
    DataSet = cdsCanal
    Left = 280
    Top = 422
  end
  object cdsRequDet: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvRequDet'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 14
    Top = 469
  end
  object cdsRequCab: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvRequCab'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 404
    Top = 469
  end
  object dsRequDet: TwwDataSource
    DataSet = cdsRequDet
    Left = 18
    Top = 480
  end
  object dsRequCab: TwwDataSource
    DataSet = cdsRequCab
    Left = 400
    Top = 480
  end
  object cdsListaTx: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvListaTx'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 664
    Top = 531
  end
  object dsListaTx: TwwDataSource
    DataSet = cdsListaTx
    Left = 664
    Top = 544
  end
  object cdsCCanje: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvEjecuta'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 736
    Top = 531
  end
  object dsCCanje: TwwDataSource
    DataSet = cdsCCanje
    Left = 736
    Top = 544
  end
  object cdsPadre: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvPadre'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 808
    Top = 56
  end
  object cdsHijo: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvHijo'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 809
    Top = 112
  end
  object cdsNieto: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvNieto'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 811
    Top = 176
  end
  object cdsSobrino: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSobrino'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 276
    Top = 608
  end
  object dsPadre: TwwDataSource
    DataSet = cdsPadre
    Left = 808
    Top = 64
  end
  object dsHijo: TwwDataSource
    DataSet = cdsHijo
    Left = 811
    Top = 122
  end
  object dsNieto: TwwDataSource
    DataSet = cdsNieto
    Left = 814
    Top = 188
  end
  object dsSobrino: TwwDataSource
    DataSet = cdsSobrino
    Left = 280
    Top = 624
  end
  object cdsLKAlm: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvALM'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 22
    Top = 608
  end
  object dsLKAlm: TwwDataSource
    DataSet = cdsALM
    Left = 24
    Top = 624
  end
  object cdsUser: TwwClientDataSet
    Aggregates = <>
    IndexFieldNames = 'USERID'
    Params = <>
    ProviderName = 'dspUser'
    ValidateWithMask = True
    Left = 348
    Top = 608
  end
  object dsUser: TwwDataSource
    DataSet = cdsUser
    Left = 344
    Top = 624
  end
  object cdsQry10: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvEjecuta'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 89
    Top = 608
  end
  object cdsQry11: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvEjecuta'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 142
    Top = 608
  end
  object cdsQry12: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvEjecuta'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 212
    Top = 608
  end
  object dsQry10: TwwDataSource
    DataSet = cdsQry10
    Left = 88
    Top = 624
  end
  object dsQry11: TwwDataSource
    DataSet = cdsQry11
    Left = 144
    Top = 624
  end
  object dsQry12: TwwDataSource
    DataSet = cdsQry12
    Left = 208
    Top = 624
  end
  object cdsCC: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvEjecuta'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 64
    Top = 353
  end
  object dsCC: TwwDataSource
    DataSet = cdsCC
    Left = 64
    Top = 363
  end
  object DCOM1: TSocketConnection
    ServerGUID = '{80F986CD-552F-4066-882A-0F680F8FBB91}'
    ServerName = 'DMLOGSrv.srvDMLOG'
    Left = 13
    Top = 5
  end
  object cdsAcceso1: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAcceso'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 562
    Top = 608
  end
  object dsAcceso1: TwwDataSource
    DataSet = cdsAcceso1
    Left = 560
    Top = 624
  end
  object dsTipoGarantia: TwwDataSource
    DataSet = cdsTipoGarantia
    Left = 648
    Top = 624
  end
  object cdsTipoGarantia: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvEjecuta'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 637
    Top = 608
  end
  object dsCuadroComparativo: TwwDataSource
    DataSet = cdsCuadroComparativo
    Left = 792
    Top = 624
  end
  object cdsCuadroComparativo: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSCxProv'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 793
    Top = 608
  end
  object cdsProformaLista: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvProforma'
    RemoteServer = DCOM1
    OnReconcileError = cdsReqsReconcileError
    PictureMasks.Strings = (
      'PROFTOTALG'#9'*12[#][.*4[#]]'#9'T'#9'F'
      'PROFIXTCC'#9'*12[#][.*4[#]]'#9'T'#9'F'
      'PROFTTIMPU'#9'*12[#][.*4[#]]'#9'T'#9'F')
    ValidateWithMask = True
    Left = 836
    Top = 225
  end
  object dsProformaLista: TwwDataSource
    DataSet = cdsProformaLista
    Left = 836
    Top = 243
  end
  object dsDoc2: TwwDataSource
    DataSet = cdsDoc2
    Left = 860
    Top = 313
  end
  object cdsDoc2: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 861
    Top = 294
  end
  object cdsTReqOrdTrab: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTDOC'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 860
    Top = 15
  end
  object dsTReqOrdTrab: TwwDataSource
    DataSet = cdsTReqOrdTrab
    Left = 860
    Top = 23
  end
  object cdsComprador2: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvComprador'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 900
    Top = 96
  end
  object dsComprador2: TwwDataSource
    DataSet = cdsComprador2
    Left = 904
    Top = 145
  end
  object cdsOrdTrabDet: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTge'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 892
    Top = 400
  end
  object dsOrdTrabDet: TwwDataSource
    DataSet = cdsOrdTrabDet
    Left = 888
    Top = 416
  end
  object cdsCompradores: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvComprador'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 876
    Top = 496
  end
  object dsCompradores: TwwDataSource
    DataSet = cdsCompradores
    Left = 880
    Top = 545
  end
  object cdsCtaBancaria: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvEjecuta'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 916
    Top = 600
  end
  object dsCtaBancaria: TwwDataSource
    DataSet = cdsCtaBancaria
    Left = 912
    Top = 616
  end
  object cdsQryRUC: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvEjecuta'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 916
    Top = 233
  end
  object dsQryRUC: TwwDataSource
    DataSet = cdsQryRUC
    Left = 920
    Top = 245
  end
  object cdsCIAOP: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 848
    Top = 360
  end
  object dsCIAOP: TwwDataSource
    DataSet = cdsCIAOP
    Left = 848
    Top = 376
  end
  object cdsMovPag: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 928
    Top = 304
  end
  object dsMovPag: TwwDataSource
    DataSet = cdsMovPag
    Left = 936
    Top = 352
  end
end
