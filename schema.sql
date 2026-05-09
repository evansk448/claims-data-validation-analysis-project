#CLAIMANTS TABLE#

CREATE TABLE claimants (
    claimant_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    claimant_type VARCHAR(20),
    state CHAR(2)
);

#POLICIES TABLE#
  
CREATE TABLE policies (
    policy_id INT PRIMARY KEY,
    policy_number VARCHAR(20),
    policy_type VARCHAR(20),
    effective_date DATE,
    expiration_date DATE
);

#CLAIMS TABLE#
  
CREATE TABLE claims (
    claim_id INT PRIMARY KEY,
    policy_id INT,
    claimant_id INT,
    loss_date DATE,
    claim_status VARCHAR(20),
    reserve_amount DECIMAL(10,2),
    
    FOREIGN KEY (claimant_id) REFERENCES claimants(claimant_id),
    FOREIGN KEY (policy_id) REFERENCES policies(policy_id)
);

#PAYMENTS TABLE#
  
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    claim_id INT,
    payment_amount DECIMAL(10,2),
    payment_date DATE,
    payment_status VARCHAR(20),
    
    FOREIGN KEY (claim_id) REFERENCES claims(claim_id)
);
