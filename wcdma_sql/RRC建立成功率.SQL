    SELECT
        servlev.WCEL_ID,
        servlev.rpdate,
        servlev.RRC建立成功率,
        servlev.X_RRC建立成功率,
        servlev.Y_RRC建立成功率,
        servlev.无线接通率,
        servlev.RRC_CONN_STP_FAIL_HC,
        servlev.RRC_CONN_STP_FAIL_AC,
        servlev.RRC_CONN_STP_FAIL_BTS,
        servlev.RRC_CONN_STP_FAIL_TRANS,
        servlev.RRC_CONN_STP_FAIL_RNC,
        servlev.RRC_CONN_STP_FAIL_FROZBS,
        servlev.RRC_CONN_ACC_FAIL_RADIO,
        servlev.RRC_CONN_ACC_FAIL_MS,
        servlev.RRC_CONN_ACC_FAIL_RNC,
        servlev.RRC_CONN_STP_FAIL_RNTI_ALLO,
        servlev.RRC_CONN_STP_FAIL_IUB_AAL2,
        servlev.RRC_CONN_STP_REJ_IUB_AAL2,
        servlev.RRC_CONN_STP_FAIL_ICSU_OVERL
        
    FROM
        (Select
            servlev.WCEL_ID,
            to_char(servlev.period_start_time,'YYYY-MM-DD-HH24') rpdate,
            ROUND(Decode(Sum(servlev.RAB_STP_ATT_CS_VOICE + servlev.RAB_STP_ATT_CS_CONV +
            servlev.RAB_STP_ATT_CS_STREA + servlev.RAB_STP_ATT_PS_CONV + servlev.RAB_STP_ATT_PS_STREA
            + servlev.RAB_STP_ATT_PS_INTER + servlev.RAB_STP_ATT_PS_BACKG) *
            Sum(servlev.MOC_CONV_CALL_ATTS + servlev.MTC_CONV_CALL_ATTS - servlev.RRC_ATT_REP_MO_CONV
            - servlev.RRC_ATT_REP_MT_CONV - servlev.RRC_ACC_REL_MO_CONV - servlev.RRC_ACC_REL_MT_CONV
            + servlev.MOC_STREA_CALL_ATTS + servlev.MOC_INTER_CALL_ATTS + servlev.MOC_BACKG_CALL_ATTS
            + servlev.MTC_STREA_CALL_ATTS + servlev.MTC_INTER_CALL_ATTS + servlev.MTC_BACKG_CALL_ATTS
            - servlev.RRC_ATT_REP_MO_STREAMING - servlev.RRC_ATT_REP_MO_INTERACTIVE -
            servlev.RRC_ATT_REP_MO_BACKGROUND - servlev.RRC_ATT_REP_MT_STREAMING -
            servlev.RRC_ATT_REP_INTERACTIVE - servlev.RRC_ATT_REP_MT_BACKGROUND -
            servlev.RRC_ACC_REL_MO_STREAMING - servlev.RRC_ACC_REL_MO_INTERACTIVE -
            servlev.RRC_ACC_REL_MO_BACKGROUND - servlev.RRC_ACC_REL_MT_STREAMING -
            servlev.RRC_ACC_REL_INTERACTIVE - servlev.RRC_ACC_REL_MT_BACKGROUND), 0, 0,
            Sum(servlev.SUCC_RRC_SETUP_CONV + servlev.SUCC_RRC_SETUP_STREA +
            servlev.SUCC_RRC_SETUP_INTERA + servlev.SUCC_RRC_SETUP_BACKG) *
            Sum(servlev.RAB_ACC_COMP_CS_VOICE + servlev.RAB_ACC_COMP_CS_CONV +
            servlev.RAB_ACC_COMP_CS_STREA + servlev.RAB_ACC_COMP_PS_CONV +
            servlev.RAB_ACC_COMP_PS_STREA + servlev.RAB_ACC_COMP_PS_INTER +
            servlev.RAB_ACC_COMP_PS_BACKG) / (Sum(servlev.RAB_STP_ATT_CS_VOICE +
            servlev.RAB_STP_ATT_CS_CONV + servlev.RAB_STP_ATT_CS_STREA + servlev.RAB_STP_ATT_PS_CONV
            + servlev.RAB_STP_ATT_PS_STREA + servlev.RAB_STP_ATT_PS_INTER +
            servlev.RAB_STP_ATT_PS_BACKG) * Sum(servlev.MOC_CONV_CALL_ATTS +
            servlev.MTC_CONV_CALL_ATTS - servlev.RRC_ATT_REP_MO_CONV - servlev.RRC_ATT_REP_MT_CONV -
            servlev.RRC_ACC_REL_MO_CONV - servlev.RRC_ACC_REL_MT_CONV + servlev.MOC_STREA_CALL_ATTS +
            servlev.MOC_INTER_CALL_ATTS + servlev.MOC_BACKG_CALL_ATTS + servlev.MTC_STREA_CALL_ATTS +
            servlev.MTC_INTER_CALL_ATTS + servlev.MTC_BACKG_CALL_ATTS -
            servlev.RRC_ATT_REP_MO_STREAMING - servlev.RRC_ATT_REP_MO_INTERACTIVE -
            servlev.RRC_ATT_REP_MO_BACKGROUND - servlev.RRC_ATT_REP_MT_STREAMING -
            servlev.RRC_ATT_REP_INTERACTIVE - servlev.RRC_ATT_REP_MT_BACKGROUND -
            servlev.RRC_ACC_REL_MO_STREAMING - servlev.RRC_ACC_REL_MO_INTERACTIVE -
            servlev.RRC_ACC_REL_MO_BACKGROUND - servlev.RRC_ACC_REL_MT_STREAMING -
            servlev.RRC_ACC_REL_INTERACTIVE - servlev.RRC_ACC_REL_MT_BACKGROUND)))*100,2) As 无线接通率,
            
            ROUND(Decode(Sum(servlev.RRC_CONN_STP_ATT + servlev.RRC_CONN_SETUP_COMP_AFT_DIR -
            servlev.RRC_CONN_STP_REJ_EMERG_CALL - servlev.RRC_CONN_ACC_REL_CELL_RESEL -
            servlev.RRC_CONN_SETUP_ATT_REPEAT), 0, 0, Sum(servlev.RRC_CONN_ACC_COMP +
            servlev.RRC_CON_SETUP_COMP_DIRECTED) / Sum(servlev.RRC_CONN_STP_ATT +
            servlev.RRC_CONN_SETUP_COMP_AFT_DIR - servlev.RRC_CONN_STP_REJ_EMERG_CALL -
            servlev.RRC_CONN_ACC_REL_CELL_RESEL - servlev.RRC_CONN_SETUP_ATT_REPEAT))*100,2) As RRC建立成功率,
            
            Sum(servlev.RRC_CONN_ACC_COMP + servlev.RRC_CON_SETUP_COMP_DIRECTED) As X_RRC建立成功率,
            
            Sum(servlev.RRC_CONN_STP_ATT + servlev.RRC_CONN_SETUP_COMP_AFT_DIR -
            servlev.RRC_CONN_STP_REJ_EMERG_CALL - servlev.RRC_CONN_ACC_REL_CELL_RESEL -
            servlev.RRC_CONN_SETUP_ATT_REPEAT) As Y_RRC建立成功率,
            
            Sum(servlev.RRC_CONN_STP_FAIL_HC) As RRC_CONN_STP_FAIL_HC,
            Sum(servlev.RRC_CONN_STP_FAIL_AC) As RRC_CONN_STP_FAIL_AC,
            Sum(servlev.RRC_CONN_STP_FAIL_BTS) As RRC_CONN_STP_FAIL_BTS,
            Sum(servlev.RRC_CONN_STP_FAIL_TRANS) As RRC_CONN_STP_FAIL_TRANS,
            Sum(servlev.RRC_CONN_STP_FAIL_RNC) As RRC_CONN_STP_FAIL_RNC,
            Sum(servlev.RRC_CONN_STP_FAIL_FROZBS) As RRC_CONN_STP_FAIL_FROZBS,
            Sum(servlev.RRC_CONN_ACC_FAIL_RADIO) As RRC_CONN_ACC_FAIL_RADIO,
            Sum(servlev.RRC_CONN_ACC_FAIL_MS) As RRC_CONN_ACC_FAIL_MS,
            Sum(servlev.RRC_CONN_ACC_FAIL_RNC) As RRC_CONN_ACC_FAIL_RNC,
            Sum(servlev.RRC_CONN_STP_FAIL_RNTI_ALLO) As RRC_CONN_STP_FAIL_RNTI_ALLO,
            Sum(servlev.RRC_CONN_STP_FAIL_IUB_AAL2) As RRC_CONN_STP_FAIL_IUB_AAL2,
            Sum(servlev.RRC_CONN_STP_REJ_EMERG_CALL) As RRC_CONN_STP_REJ_IUB_AAL2,
            Sum(servlev.RRC_CONN_STP_FAIL_ICSU_OVERL) As RRC_CONN_STP_FAIL_ICSU_OVERL
            
        From
            NOKRWW_PS_SERVLEV_MNC1_RAW servlev
            
        Where
            servlev.PERIOD_START_TIME >= To_Date(&start_dateTime, 'yyyy-mm-dd-hh24') And
            servlev.PERIOD_START_TIME < To_Date(&end_datetime, 'yyyy-mm-dd-hh24')
            
        Group By
            servlev.WCEL_ID,
            to_char(servlev.period_start_time,'YYYY-MM-DD-HH24')
        )  servlev
        
    WHERE
        (RRC建立成功率 < 97 and Y_RRC建立成功率 > 90)

    ORDER BY
        RRC建立成功率  

    