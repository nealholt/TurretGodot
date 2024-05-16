

Suppose $\vec{p}$ is the global position of our target and $\vec{n}$ is the turret's basis.y vector, the vector pointing parallel to the ``spine" of the turret, up and out the top of the ``head", then the component of $\vec{p}$ that is parallel to $\vec{n}$ is given by:
$$Proj_{\vec{n}}\vec{p} = \frac{\vec{p} \cdot \vec{n}}{\vec{n} \cdot \vec{n}} \vec{n}$$
In other words, $Proj_{\vec{n}}\vec{p}$ is the vector indicating how far above (or below) the plane of our turret $\vec{p}$ is.

To project $\vec{p}$ onto the plane, we simply subtract $Proj_{\vec{n}}\vec{p}$, which I think of as the vertical component above (or below) the plane:

$$ \vec{p} - Proj_{\vec{n}}\vec{p}$$


