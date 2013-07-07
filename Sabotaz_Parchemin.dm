<module>

    <!-- Information sur le module -->
    <header>
        <!-- Nom affiché dans la liste des modules -->
        <name>Le parchemin</name>        
        <!-- Version du module -->
        <version>1.1</version>
        <!-- Dernière version de dofus pour laquelle ce module fonctionne -->
        <dofusVersion>2.3.5</dofusVersion>
        <!-- Auteur du module -->
        <author>Sabotaz</author>
        <!-- Courte description -->
        <shortDescription>Un bloc-note très utile !</shortDescription>
        <!-- Description détaillée -->
        <description>Ce module permet de sauvegarder de manière temporaire ou permanente les petits messages qu'on lui soumet, et de les afficher dans une interface dédiée.</description>
	</header>

    <!-- Liste des interfaces du module, avec nom de l'interface, nom du fichier squelette .xml et nom de la classe script d'interface -->
    <uis>
        <ui name="postit" file="xml/postit.xml" class="ui::PostitUI" />
    </uis>
    
    <script>Parchemin.swf</script>
    
</module>
