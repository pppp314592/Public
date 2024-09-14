#参考
#https://github.com/genkuroki/public/blob/main/0049/onclick.py
#https://qiita.com/SumMae/items/8107e646030d46313c2a
#https://qiita.com/ceptree/items/c9239ce4e442482769b3

#Juliaでmatplotlibを使いポイント座標csvを生成するスクリプト　
#グラフを別窓で出すために、cmdで「julia -i onclick2.jl」でインタラクティブモードで実行

import PythonPlot: pyplot as plt
using CSV
using DataFrames
using PythonCall

#pyobjectのNone判定用
PYNONE = (@py None)
gco = PYNONE
isPyNone(po) = Bool(po == PYNONE)

#クリックイベント
function onclick(event)
    global gco
    isPyNone(event.inaxes) && return
    if Bool(event.button == 2)
        #csv保存
        ax2csv()
    elseif Bool(event.button == 1) && !isPyNone(event.xdata) && !isPyNone(event.ydata)
        #Point追加
        gco = plt.scatter(event.xdata, event.ydata, picker=10)
        plt.draw()
    end
end

#ドラッグイベント
function motion(event)
    global gco
    #右クリック＆ドラッグ動作
    if Bool(event.button == 3) && !isPyNone(gco)
        if isPyNone(event.inaxes) || isPyNone(event.xdata) || isPyNone(event.ydata)
            #範囲外削除
            gco.remove()
            gco = PYNONE
        else
            #Point移動
            gco.set_offsets([event.xdata, event.ydata])
        end
        plt.draw()
    else
        gco = PYNONE
    end
end

#他イベント
onpick(event) = (global gco = event.artist)
release(event) = (global gco = PYNONE)
onclose(event) = exit() #closeしてjuliaごと終わりにする

#ax情報からCSV保存
function ax2csv(ax=ax)
    xys = [points.get_offsets() for points in ax.collections]
    df = DataFrame(x=[p[0][0] for p in xys], y=[p[0][1] for p in xys])
    @show df
    CSV.write("data.csv", df)
    println("Data saved to data.csv")
end

plt.rcParams["font.family"] = "Meiryo"
fig, ax = plt.subplots()
ax.set_aspect("equal")
ax.set_title("左クリック：Pointの追加 右クリックドラック：Pointの移動（範囲外削除）\nホイールボタン：Pointをdata.csv保存 ")
ax.set_xlim(0, 10)
ax.set_ylim(0, 10)

plt.connect("button_press_event", onclick)
plt.connect("pick_event", onpick)
plt.connect("motion_notify_event", motion)
plt.connect("button_release_event", release)
plt.connect("close_event", onclose)
