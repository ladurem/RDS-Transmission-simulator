%Permet de generer les bits necessaires a la couche MAC
for i=1:11
bits = MAC_emetteur(i);
bits_est = couche_physique_main(bits);
MAC_recepteur();
end
