package io.drglso

import android.app.Activity
import android.os.Bundle
import android.view.SurfaceView
import android.view.SurfaceHolder
import android.graphics.Color

class MainActivity : Activity(), SurfaceHolder.Callback {

    private lateinit var surface: SurfaceView

    override fun onCreate(b: Bundle?) {
        super.onCreate(b)
        surface = SurfaceView(this)
        surface.holder.addCallback(this)
        setContentView(surface)
    }

    override fun surfaceCreated(h: SurfaceHolder) {
        val c = h.lockCanvas()
        c.drawColor(Color.BLACK)
        h.unlockCanvasAndPost(c)
    }

    override fun surfaceChanged(h: SurfaceHolder, fmt: Int, w: Int, h2: Int) {}
    override fun surfaceDestroyed(h: SurfaceHolder) {}
}
