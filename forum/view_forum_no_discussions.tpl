{include file='header.tpl'}
{include file='navbar.tpl'}

<div class="ui stackable padded grid" id="forum-view">
    <div class="ui centered row">
        <div class="ui header"   style="  display: flex;
    flex-direction: row;
    flex: 1 1;
    margin: 0 20px;">
            <h2 class="ui header" style="display: flex;flex-direction: row;flex: 1 1;justify-content: space-between;">
                {$FORUM_TITLE}

                {if $NEW_TOPIC_BUTTON}
                <div class="res right floated">
                    <a class="ui small primary button" href="{$NEW_TOPIC_BUTTON}">{$NEW_TOPIC}</a>
                </div>
                {/if}
            </h2>
        </div>
    </div>
</div>


<div class="ui stackable padded grid" id="forum-view">
    <div class="ui centered row">
        {if count($WIDGETS_LEFT)}
        <div class="ui five wide tablet four wide computer column">
            {foreach from=$WIDGETS_LEFT item=widget}
            {$widget}
            {/foreach}
        </div>
        {/if}
        <div
            class="ui {if count($WIDGETS_LEFT) && count($WIDGETS_RIGHT) }four wide tablet eight wide computer{elseif count($WIDGETS_LEFT) || count($WIDGETS_RIGHT)}ten wide tablet twelve wide computer{else}sixteen wide{/if} column">
            {if count($SUBFORUMS)}
            <table class="ui fixed single line selectable unstackable small padded res table card-body" id="subforums-table">
                <thead>
                    <tr>
                        <th class="nine wide" style="background: #131313;color:#fff;">
                            <h4>{$SUBFORUM_LANGUAGE}</h4>
                        </th>
                        <th class="seven wide" style="background: #131313;color:#fff;"></th>
                    </tr>
                </thead>
                <tbody style="background-color: #151515;">
                    {foreach from=$SUBFORUMS item=subforum}
                    <tr>
                        <td>
                            <h5 class="ui header">
                                {if empty($subforum.icon)}<i class="comment icon"></i>{else}{$subforum.icon}{/if}
                                <div class="content">
                                    <a href="{$subforum.link}" data-toggle="popup">{$subforum.title}</a>
                                    <div class="ui wide popup">
                                        <h4 class="ui header">{$subforum.title}</h4>
                                        {$TOPICS|capitalize}: <b>{$subforum.topics}</b>
                                    </div>
                                    <div class="sub header">
                                        {if !$subforum.redirect}{$TOPICS|capitalize}: <b>{$subforum.topics}</b>{/if}
                                    </div>
                                </div>
                            </h5>
                        </td>
                        <td>
                            {if !$subforum.redirect}
                            {if !empty($subforum.latest_post)}
                            <h5 class="ui header">
                                <img class="ui mini circular image" src="{$subforum.latest_post.last_user_avatar}">
                                <div class="content">
                                    <a href="{$subforum.latest_post.link}"
                                        data-toggle="popup">{$subforum.latest_post.title}</a>
                                    <div class="ui wide popup">
                                        <h4 class="ui header">{$subforum.latest_post.title}</h4>
                                        <br />{$BY|capitalize} <a style="{$subforum.latest_post.last_user_style}"
                                            href="{$subforum.latest_post.last_user_link}">{$subforum.latest_post.last_user}</a>
                                        | {$subforum.latest_post.time}
                                    </div>
                                    <div class="sub header">
                                        <a href="{$subforum.latest_post.last_user_link}"
                                            data-poload="{$USER_INFO_URL}{$subforum.latest_post.last_user_id}"
                                            style="{$subforum.latest_post.last_user_style}">{$subforum.latest_post.last_user}</a>
                                        &middot;
                                        <span data-toggle="tooltip"
                                            data-content="{$subforum.latest_post.time}">{$subforum.latest_post.timeago}</span>
                                    </div>
                                </div>
                            </h5>
                            {else}
                            {$NO_TOPICS}
                            {/if}
                            {/if}
                        </td>
                    </tr>
                    {/foreach}
                </tbody>
            </table>
            {/if}
            <table class="ui single line selectable unstackable small padded res table card-body" id="normal-threads">
                <thead>
                    <tr>
                        <th class="sixteen wide" style="background:var(--sec-color);box-shadow:var(--border-box);color:#fff;padding:20px;text-transform:uppercase;">
                            <h4>{$TOPICS|capitalize}</h4>
                        </th>
                    </tr>
                </thead>
                <tbody style="background-color: #151515;">
                    <tr>
                        <td>
                            {$NO_TOPICS_FULL}
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        {if count($WIDGETS_RIGHT)}
        <div class="ui five wide tablet four wide computer column">
            {foreach from=$WIDGETS_RIGHT item=widget}
            {$widget}
            {/foreach}
        </div>
        {/if}
    </div>
</div>

{include file='footer.tpl'}