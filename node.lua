gl.setup(NATIVE_WIDTH, NATIVE_HEIGHT)

local res = util.auto_loader()

node.alias("gauge")

local mode = 0;

local color = {
  red = 0;
  green = 0;
  blue = 0;
}


util.data_mapper{
    ["mode"] = function(value)
        print(value)
        mode = tonumber(value)
    end;
    ["color/(.*)"] = function(c, value)
        color[c] = tonumber(value)
    end;
}


function play_video()
    if video then
        video:dispose()
    end
    video = util.videoplayer("1.mkv", {loop=false})
end


function node.render()
    if mode == 1 then
        gl.clear(color.red, color.green, color.blue, 1)
    elseif mode == 2 then
        if not video then
            play_video()
        end
        util.draw_correct(video, 0, 0, WIDTH, HEIGHT)
    elseif mode == 3 then
        video:dispose()
        video = nil
    else
        gl.clear(0,0,0,1)
    end
end
