<form action="" method="POST">
    <div class="form-group">
        <label for="customColor">Custom Color</label>
        <input class="form-control" type="text" name="customColor" value="{$CUSTOM_COLOR}" id="customColor" />
    </div>
    <div class="form-group">
        <label for="ipMC">Minecraft display text</label>
        <input class="form-control" type="text" name="ipMC" value="{$MINECRAFT_IP_TEXT}" id="ipMC" />
    </div>
    <div class="form-group">
        <label for="ipDiscord">Discord invite text</label>
        <input class="form-control" type="text" name="ipDiscord" value="{$DISCORD_INVITE}" id="ipDiscord" />
    </div>
    <div class="form-group">
        <label for="mcIP">Minecraft ip</label>
        <input class="form-control" type="text" name="mcIP" value="{$MINECRAFT_IP}" id="mcIP" />
    </div>
    <div class="form-group">
        <label for="mcPORT">Minecraft port</label>
        <input class="form-control" type="text" name="mcPORT" value="{$MINECRAFT_PORT}" id="mcPORT" />
    </div>
    <div class="form-group">
        <label for="discordID">Discord id</label>
        <input class="form-control" type="text" name="discordID" value="{$DISCORD_ID}" id="discordID" />
    </div>
    <div class="form-group">
        <label for="inputHomeCustomContent">{$HOME_CUSTOM_CONTENT}</label>
        <textarea name="home_custom_content" id="inputHomeCustomContent"></textarea>
    </div>
    <div class="form-group">
        <input type="hidden" name="token" value="{$TOKEN}">
        <input type="submit" class="btn btn-primary" value="{$SUBMIT}">
    </div>
</form>