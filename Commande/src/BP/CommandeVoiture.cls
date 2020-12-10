/// 
Class BP.CommandeVoiture Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='msg.realiserCommandeDmde' response='msg.realiserCommandeRpse' height='2000' width='2000' >
<context>
<property name='voitureCatalogue' type='webObjet.wsCatalogue' instantiate='0' />
<property name='voiture' type='webObjet.wsVoiture' instantiate='0' />
</context>
<sequence xend='200' yend='1100' >
<call name='getCatalogue' target='Catalogue' async='0' xpos='200' ypos='250' >
<request type='msg.consulterVoitureCatalogueDmde' >
<assign property="callrequest.marque" value="request.marque" action="set" />
<assign property="callrequest.modele" value="request.modele" action="set" />
</request>
<response type='msg.consulterVoitureCatalogueRpse' >
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
<assign property="context.voitureCatalogue" value="callresponse.voiture" action="set" />
</response>
</call>
<if name='codeRetour' condition='response.codeRetour = "OK"' xpos='200' ypos='350' xend='200' yend='1000' >
<true>
<transform name='Catalogue To Voiture' class='Transform.TransformVoitureCatalogueToVoiture' source='context.voitureCatalogue' target='context.voiture' xpos='335' ypos='500' />
<call name='Génération Plaque' target='Plaque' async='0' xpos='335' ypos='600' >
<request type='msg.generationPlaqueDmde' />
<response type='msg.generationPlaqueRpse' >
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
<assign property="context.voiture.plaque" value="callresponse.plaque" action="set" />
</response>
</call>
<assign name="Affectation couleur" property="context.voiture.couleur" value="request.couleur" action="set" xpos='335' ypos='700' />
<call name='Création Voiture' target='Voiture' async='0' xpos='335' ypos='800' >
<request type='msg.creerVoitureDmde' >
<assign property="callrequest.voiture" value="context.voiture" action="set" />
</request>
<response type='msg.creerVoitureRpse' >
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
</response>
</call>
<call name='Dépôt fichier Voiture' target='File' async='1' xpos='335' ypos='900' >
<request type='msg.pushVoitureFileDmde' >
<assign property="callrequest.voiture" value="context.voiture" action="set" />
</request>
<response type='Ens.Response' />
</call>
</true>
</if>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
