/// 
Class Rule.CommandeVoiture Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.MsgRouter.RoutingEngine" production="Production.ProductionReservation">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="">
<constraint name="source" value="Service fichier commande"></constraint>
<when condition="1=1">
<send transform="msg.Transform.CreerVoitureCommandeToCreerVoiture" target="Voiture"></send>
<return></return>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
