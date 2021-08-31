using { sap.ui.riskmanagement as my } from '../db/schema';

@path: 'service/risk'
service RiskService {
  entity Risks @(restrict : [
            {
                grant : [ 'READ' ],
                to : [ 'RiskViewer24' ]
            },
            {
                grant : [ '*' ],
                to : [ 'RiskManager24' ]
            }
        ]) as projection on my.Risks;
//### END OF INSERT
    annotate Risks with @odata.draft.enabled;
 
//### BEGIN OF INSERT
  entity Mitigations @(restrict : [
            {
                grant : [ 'READ' ],
                to : [ 'RiskViewer24' ]
            },
            {
                grant : [ '*' ],
                to : [ 'RiskManager24' ]
            }
        ]) as projection on my.Mitigations;
//### END OF INSERT
    annotate Mitigations with @odata.draft.enabled;

  //entity BusinessPartners as projection on my.BusinessPartners; 

  view riskmit as
  select A.ID, A.title, A.owner,B.description
  from my.Risks as A inner join my.Mitigations as B
  on A.miti_id = B.ID;
}