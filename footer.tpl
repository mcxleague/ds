</div>
</div>

<div class="ui inverted vertical footer segment" id="footer">
    <div class="ui container">
        <section id="footer">
            <div class="inner">
                <div class="footer-col">
                    <div class="left">
                        <h1>© {$SITE_NAME}</h1>
                        <p>
                            We are not affiliated with or endorsed by Mojang, AB.<br>
                            Designed by <a href="https://stefanm.me" target="_blank">eternity</a>
                        </p>
                    </div>
                    <div class="right">
                        <ul>
                            <li>
                                <a href="#"><i class="fab fa-twitter"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fab fa-youtube"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fab fa-twitch"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fab fa-discord"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>

{if isset($GLOBAL_WARNING_TITLE)}
<div class="ui medium modal" id="modal-acknowledge">
    <div class="header">
        {$GLOBAL_WARNING_TITLE}
    </div>
    <div class="content">
        {$GLOBAL_WARNING_REASON}
    </div>
    <div class="actions">
        <a class="ui positive button" href="{$GLOBAL_WARNING_ACKNOWLEDGE_LINK}">{$GLOBAL_WARNING_ACKNOWLEDGE}</a>
    </div>
</div>
{/if}

{foreach from=$TEMPLATE_JS item=script}
    {$script}
{/foreach}

{if isset($GLOBAL_WARNING_TITLE)}
<script type="text/javascript">
    $('#modal-acknowledge').modal({ closable: false }).modal('show');
</script>
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

<script type="text/javascript">
    function toggleDarkLightMode() {
        $.post("{$DARK_LIGHT_MODE_ACTION}", { token: "{$DARK_LIGHT_MODE_TOKEN}" })
            .done(function () {
                window.location.reload();
            });

        return false;
    }

    {if !$LOGGED_IN_USER}
    const autoLanguage = document.getElementById('auto-language');
    const autoLanguageValue = $.cookie('auto_language') ?? 'true';
    autoLanguage.innerText = '{$AUTO_LANGUAGE_TEXT} (' + (autoLanguageValue === 'true' ? '{$ENABLED}' : '{$DISABLED}') + ')';
    {/if}

    function toggleAutoLanguage() {
        $.cookie(
            'auto_language',
            autoLanguageValue === 'true' ? 'false' : 'true',
            { path: '/' }
        );
        window.location.reload();
    }
</script>

<script>
$(window).on("load",function(){
     $(".loader-wrapper").fadeOut("slow");
});
</script>


{if isset($NEW_UPDATE) && ($NEW_UPDATE_URGENT != true)}
<script src="{$TEMPLATE.path}/js/core/update.js"></script>
{/if}

{if !isset($EXCLUDE_END_BODY)}
{if isset($DEBUGBAR_HTML)}
{$DEBUGBAR_HTML}
{/if}
</body>

</html>
{/if}
