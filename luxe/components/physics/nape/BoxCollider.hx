package luxe.components.physics.nape;

#if nape

import nape.phys.Body;
import nape.phys.BodyType;
import nape.shape.Polygon;

import luxe.components.physics.nape.NapeBody;

typedef BoxColliderOptions = {

    > NapeBodyOptions,
    
        /** the x position of the box */
    var x : Float;
        /** the y position of the box */
    var y : Float;
        /** the width of the box */
    var w : Float;
        /** the height of the box */
    var h : Float;

} //BoxColliderOptions

class BoxCollider extends NapeBody {

    var options : BoxColliderOptions;

    public function new(_options : BoxColliderOptions) : Void {

        options = _options;

        super(options);

    } //new

    override function onadded() {

        super.onadded();

            var verts = Polygon.box(options.w, options.h);
            body.shapes.add(new Polygon(verts, options.material, options.filter));
            body.position.setxy(options.x, options.y);

        post_add();

    } //onadded

} //BoxCollider

#end //nape