function Vector2(_x, _y) {
    return {
        X: _x,
        Y: _y,

        Zero: function() {
            self.X = 0;
            self.Y = 0;
        },

        Add: function(v) {
            self.X += v.X;
            self.Y += v.Y;
        },

        Subtract: function(v) {
            self.X -= v.X;
            self.Y -= v.Y;
        },

        Scale: function(s) {
            self.X *= s;
            self.Y *= s;
        },

        Dot: function(v) {
            return self.X * v.X + self.Y * v.Y;
        },

        Length: function() {
            return sqrt(sqr(self.X) + sqr(self.Y));
        },

        Normalise: function() {
            var len = self.Length();
            if (len == 0) return;

            self.X /= len;
            self.Y /= len;
        },

        Clone: function() {
            return Vector2(self.X, self.Y);
        }
    }
}
