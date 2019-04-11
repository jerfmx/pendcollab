package pendcolab

import org.radeox.engine.context.BaseRenderContext
import org.radeox.api.engine.context.RenderContext
import org.radeox.api.engine.RenderEngine
import org.radeox.api.engine.WikiRenderEngine
import org.radeox.engine.BaseRenderEngine
import org.radeox.filter.*
import org.radeox.macro.*

class MiRadeoxTagLib {

	static namespace = "pendcolab"
    static final RenderContext CONTEXT 
    static final RenderEngine  ENGINE

    static {
        CONTEXT = new BaseRenderContext()
        ENGINE = new MiGrailsWikiEngine()
        ENGINE.init()
        CONTEXT.renderEngine = ENGINE

        def repo = MacroRepository.getInstance()
        repo.put('groovy', new MiGroovyMacro())
    }


    def radeoxRender = { attribs, body ->
        out << ENGINE.render(body().readAsString(), CONTEXT)
    }
}
