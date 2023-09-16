<?php

    /** 
  
	true    
	464268
	MasonX888
	1694904146
	105215
	27616

    **/
    

if (Input::exists()) {
    if (Token::check()) {
        $cache->setCache('template_settings');

        if (isset($_POST['customColor'])) {
            $cache->store('customColor', $_POST['customColor']);
        }

        if (isset($_POST['ipMC'])) {
            $cache->store('ipMC', $_POST['ipMC']);
        }

        if (isset($_POST['ipDiscord'])) {
            $cache->store('ipDiscord', $_POST['ipDiscord']);
        }

        if (isset($_POST['mcIP'])) {
            $cache->store('mcIP', $_POST['mcIP']);
        }

        if (isset($_POST['mcPORT'])) {
            $cache->store('mcPORT', $_POST['mcPORT']);
        }

        if (isset($_POST['discordID'])) {
            $cache->store('discordID', $_POST['discordID']);
        }

        Util::setSetting('home_custom_content', Input::get('home_custom_content'));

        Session::flash('admin_templates', $language->get('admin', 'successfully_updated'));
    } else {
        $errors = [$language->get('general', 'invalid_token')];
    }
}

// Get values
$cache->setCache('template_settings');
if ($cache->isCached('customColor')) {
    $customColor = $cache->retrieve('customColor');
} else {
    $customColor = '#03C988';
    $cache->store('customColor', $customColor);
}

if ($cache->isCached('ipMC')) {
    $ipMC = $cache->retrieve('ipMC');
} else {
    $ipMC = 'discord.gg/hypixel';
    $cache->store('ipMC', $ipMC);
}

if ($cache->isCached('ipDiscord')) {
    $ipDiscord = $cache->retrieve('ipDiscord');
} else {
    $ipDiscord = 'discord.gg/hypixel';
    $cache->store('ipDiscord', $ipDiscord);
}

if ($cache->isCached('mcIP')) {
    $mcIP = $cache->retrieve('mcIP');
} else {
    $mcIP = 'hypixel.net';
    $cache->store('mcIP', $mcIP);
}

if ($cache->isCached('mcPORT')) {
    $mcPORT = $cache->retrieve('mcPORT');
} else {
    $mcPORT = '25565';
    $cache->store('mcPORT', $mcPORT);
}

if ($cache->isCached('discordID')) {
    $discordID = $cache->retrieve('discordID');
} else {
    $discordID = '511984944889987082';
    $cache->store('discordID', $discordID);
}

$current_template->assets()->include([
    AssetTree::TINYMCE,
]);

$current_template->addJSScript(Input::createTinyEditor($language, 'inputHomeCustomContent', Util::getSetting('home_custom_content')));

$smarty->assign([
    'SUBMIT' => $language->get('general', 'submit'),
    'ENABLED' => $language->get('admin', 'enabled'),
    'DISABLED' => $language->get('admin', 'disabled'),
    'CUSTOM_COLOR' => $customColor,
    'MINECRAFT_IP_TEXT' => $ipMC,
    'DISCORD_INVITE' => $ipDiscord,
    'MINECRAFT_IP' => $mcIP,
    'MINECRAFT_PORT' => $mcPORT,
    'DISCORD_ID' => $discordID,
    'HOME_CUSTOM_CONTENT' => $language->get('admin', 'home_custom_content'),
    'SETTINGS_TEMPLATE' => ROOT_PATH . '/custom/templates/Eligius/template_settings/settings.tpl'
]);