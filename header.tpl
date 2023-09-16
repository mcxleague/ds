{if "HTML_CLASS"|defined}{assign var="HTMLCLASS" value=" {$smarty.const.HTML_CLASS}"}{else}{assign var="HTMLCLASS"
value=""}{/if}
{if "HTML_LANG"|defined}{assign var="HTMLLANG" value=" lang='{$smarty.const.HTML_LANG}'"}{else}{assign var="HTMLLANG"
value=" lang='en'"}{/if}
{if "HTML_RTL"|defined && $smarty.const.HTML_RTL eq true}{assign var="HTMLRTL" value=" dir='rtl'"}{else}{assign
var="HTMLRTL" value=" dir='ltr'"}{/if}
{if "LANG_CHARSET"|defined}{assign var="METACHARSET" value="{$smarty.const.LANG_CHARSET}"}{else}{assign
var="METACHARSET" value="utf-8"}{/if}
{if isset($PAGE_DESCRIPTION) && $PAGE_DESCRIPTION|count_characters > 0}{assign var="PAGEDESCRIPTION"
value="{$PAGE_DESCRIPTION}"}{else}{assign var="PAGEDESCRIPTION" value=" "}{/if}
{if isset($PAGE_KEYWORDS) && $PAGE_KEYWORDS|count_characters > 0}{assign var="PAGEKEYWORDS"
value="{$PAGE_KEYWORDS}"}{else}{assign var="PAGEKEYWORDS" value=" "}{/if}

<!DOCTYPE html>
<html{$HTMLCLASS}{$HTMLLANG}{$HTMLRTL}>

    <head>

        <meta charset="{$METACHARSET}">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
        <title>{$TITLE} &bull; {$smarty.const.SITE_NAME}</title>

        {if isset($FAVICON)}
        <link rel="shortcut icon" href="{$FAVICON}" type="image/x-icon" />
        {/if}

        <meta name="author" content="{$smarty.const.SITE_NAME}">
        <meta name='description' content='{$PAGEDESCRIPTION}' />
        <meta name='keywords' content='{$PAGEKEYWORDS}' />

        <meta property="og:title" content="{$TITLE} &bull; {$smarty.const.SITE_NAME}" />
        <meta property="og:type" content="website" />
        <meta property="og:url" content="{$OG_URL}" />
        <meta property="og:image" content="{$OG_IMAGE}" />
        <meta property='og:description' content='{$PAGEDESCRIPTION}' />

        <!-- NEEDS -->
        <link rel="preload" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous" as="style">
        <script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script> <!-- PARTICLE -->
	<script src="https://cdn.jsdelivr.net/npm/tsparticles@1.34.0"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script> <!-- JQUERY -->
        <link href="https://api.fontshare.com/v2/css?f[]=satoshi@1,2&amp;display=swap" rel="stylesheet"> <!-- MAIN FONT -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/6.9.96/css/materialdesignicons.min.css"> <!-- MDI -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/js-cookie/3.0.1/js.cookie.min.js"></script>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.20/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.20/dist/sweetalert2.all.min.js"></script>
        <!----------->

        <!-- Twitter Card Properties -->
        <meta name="twitter:title" content="{$TITLE} &bull; {$smarty.const.SITE_NAME}" />
        <meta name="twitter:card" content="summary" />
        <meta name="twitter:image" content="{$OG_IMAGE}" />

        {if isset($PAGE_DESCRIPTION) && $PAGE_DESCRIPTION|count_characters > 0}
        <meta name="twitter:description" content="{$PAGE_DESCRIPTION}" />
        {/if}

        {foreach from=$TEMPLATE_CSS item=css}
        {$css}
        {/foreach}

        {if isset($ANALYTICS_ID)}
        {literal}
        <script async src="https://www.googletagmanager.com/gtag/js?id={/literal}{$ANALYTICS_ID}{literal}"></script>
        <script>
            window.dataLayer = window.dataLayer || [];
            function gtag() { dataLayer.push(arguments); }
            gtag('js', new Date());

            gtag('config', '{/literal}{$ANALYTICS_ID}{literal}');
        </script>
        {/literal}
        {/if}

        {if isset($DEBUGBAR_JS)}
        {$DEBUGBAR_JS}
        {/if}

        {literal}
        <script>
            $.get(`https://mc-api.net/v3/server/ping/${mc_ip}:${mc_port}/`, function (data) {
                document.getElementById('mc-online').innerHTML = data["players"]["online"];
                document.getElementById('header-mc-online').innerHTML = data["players"]["online"];
            });
            $.get(`https://discordapp.com/api/guilds/${discord_id}/embed.json`, function (data) {
                    document.getElementById('discord-online').innerHTML = data["presence_count"];
                    document.getElementById('header-discord-online').innerHTML = data["presence_count"];
            });
        $(document).ready(function() {
            $('#ip-mc').text(ip_mc);
            $('#ip-discord').text(ip_discord);
        });
        </script>
        {/literal}
    </head>
<div class="loader-wrapper">
    <span class="loader"><img src="https://quak.ovh/3H2eYBh.png" /></span>
</div>
    <body id="page-{if is_numeric($smarty.const.PAGE)}{$TITLE}{else}{$smarty.const.PAGE}{/if}">