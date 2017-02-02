
#define intersectAABBpoint
///intersectAABBpoint(vec, aabb)
var b, bp, bs, p, dx, px, dy, py, hit, s;
p = argument0;
b = argument1;

dx = p[0] - b.position[0];
px = b.size[0] - abs(dx);
if px <= 0 {
    return 0;
}

dy = p[1] - b.position[1];
py = b.size[1] - abs(dy);
if py <= 0 {
    return 0;
}

hit = newHit(b);
if px < py {
    s = sign(dx);
    hit.normal = newVec(s, 0);
    hit.overlap = newVec(px * s, 0);
    hit.position = newVec(b.position[0] + (b.size[0] * s), p[1]);
} else {
    s = sign(dy);
    hit.normal = newVec(0, s);
    hit.overlap = newVec(0, py * s);
    hit.position = newVec(p[0], b.position[1] + (b.size[1] * s));
}

return hit;

#define intersectAABBAABB
///intersectAABBAABB(aabb, aabb)
var b1, b2, bp1, bs1, bp2, bs2, dx, px, dy, py, hit, s;
b1 = argument0;
b2 = argument1;

dx = b2.position[0] - b1.position[0];
px = (b2.size[0] + b1.size[0]) - abs(dx);
if px <= 0 {
    return 0;
}

dy = b2.position[1] - b1.position[1];
py = (b2.size[1] + b1.size[1]) - abs(dy);
if py <= 0 {
    return 0;
}

hit = newHit(b2)
if px < py {
    s = sign(dx);
    hit.normal = newVec(s, 0);
    hit.overlap = newVec(px * s, 0);
    hit.position = newVec(b1.position[0] + (b1.size[0] * s), b2.position[1]);
} else {
    s = sign(dy);
    hit.normal = newVec(0, s);
    hit.overlap = newVec(0, py * s);
    hit.position = newVec(b2.position[0], b1.position[1] + (b1.size[1] * s));
}

return hit;