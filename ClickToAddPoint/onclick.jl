import PythonPlot: pyplot as plt
using CSV
using DataFrames
using Printf

data = []
gco = Nothing

function onclick(event)
    if !isnothing(event.inaxes)
        push!(data, (event.xdata, event.ydata))
        ax.scatter(event.xdata, event.ydata, c="blue")
        plt.draw()
    end
end


#別窓で開いたときに、処理待ちしなかったのでcloseイベント処理
function onclose(event)
    global data
    df = DataFrame(x=[p[1] for p in data], y=[p[2] for p in data])
    CSV.write("data.csv", df)
    println("Data saved to data.csv")
    #closeして終わりにしたいならexit
    exit()
end

fig, ax = plt.subplots()
ax.set_title("Click to add points")
ax.set_xlim(0, 10)
ax.set_ylim(0, 10)

fig.canvas.mpl_connect("button_press_event", onclick)
fig.canvas.mpl_connect("close_event", onclose)
