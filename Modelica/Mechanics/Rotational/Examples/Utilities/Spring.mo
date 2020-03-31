within Modelica.Mechanics.Rotational.Examples.Utilities;
model Spring "Input/output block of a spring model"
  extends Modelica.Blocks.Icons.Block;
  parameter SI.RotationalSpringConstant c=1e4
    "Spring constant";
  parameter SI.Angle phi_rel0=0
    "Unstretched spring angle";

  Components.AngleToTorqueAdaptor
    angleToTorque1(use_w=false, use_a=false)
    annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
  Modelica.Blocks.Interfaces.RealInput phi1(unit="rad")
    "Angle of left flange of force element"
    annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
  Modelica.Blocks.Interfaces.RealOutput tau1(unit="N.m")
    "Torque generated by the force element"
    annotation (Placement(transformation(extent={{-100,-90},{-120,-70}})));
  Modelica.Mechanics.Rotational.Components.Spring spring(c=c,
      phi_rel0=phi_rel0) annotation (Placement(transformation(extent={{-10,-10},
            {10,10}})));
  Modelica.Blocks.Interfaces.RealInput phi2(unit="rad")
    "Angle of right flange of force element"
    annotation (Placement(transformation(extent={{140,60},{100,100}})));
  Modelica.Blocks.Interfaces.RealOutput tau2(unit="N.m")
    "Torque generated by the force element"
    annotation (Placement(transformation(extent={{100,-90},{120,-70}})));
  Components.AngleToTorqueAdaptor
    angleToTorque2(use_w=false, use_a=false)
    annotation (Placement(transformation(extent={{30,-10},{10,10}})));
equation

  connect(angleToTorque1.flange, spring.flange_a)
    annotation (Line(points={{-18,0},{-10,0}}));
  connect(spring.flange_b, angleToTorque2.flange)
    annotation (Line(points={{10,0},{18,0}}));
  connect(phi1, angleToTorque1.phi) annotation (Line(points={{-120,80},{
          -40,80},{-40,8},{-24,8}}, color={0,0,127}));
  connect(tau1, angleToTorque1.tau) annotation (Line(points={{-110,-80},{
          -40,-80},{-40,-8},{-23,-8}}, color={0,0,127}));
  connect(angleToTorque2.phi, phi2) annotation (Line(points={{24,8},{40,8},
          {40,80},{120,80}}, color={0,0,127}));
  connect(angleToTorque2.tau, tau2) annotation (Line(points={{23,-8},{40,
          -8},{40,-80},{110,-80}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics={Text(
          extent={{-48,-36},{48,-68}},
          textColor={128,128,128},
          textString="to FMU"),      Text(
                extent={{-94,96},{-10,66}},
                horizontalAlignment=TextAlignment.Left,
          textString="phi1"),      Text(
                extent={{-150,-114},{150,-144}},
                textString="c=%c"),Bitmap(extent={{-88,-36},{92,56}},
            fileName="modelica://Modelica/Resources/Images/Mechanics/Rotational/Spring.png"),
          Text( extent={{12,96},{96,66}},
                horizontalAlignment=TextAlignment.Right,
          textString="phi2"),      Text(
                extent={{10,-60},{94,-90}},
                horizontalAlignment=TextAlignment.Right,
          textString="tau2"),      Text(
                extent={{-90,-64},{-6,-94}},
                horizontalAlignment=TextAlignment.Left,
          textString="tau1")}), Documentation(info="<html>
<p>
A linear 1D rotational spring with pure signal
interface which can be applied for
a FMU (<a href=\"https://fmi-standard.org\">Functional Mock-up Unit</a>)
exchange.
</p>
</html>"));
end Spring;
