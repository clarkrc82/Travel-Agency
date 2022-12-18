"""Flight table

Revision ID: 5fd8b1d0137e
Revises: 132d6608546d
Create Date: 2022-12-18 11:23:39.189988

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '5fd8b1d0137e'
down_revision = '132d6608546d'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('flights',
    sa.Column('id', sa.Integer(), autoincrement=True, nullable=False),
    sa.Column('flight_num', sa.Integer(), nullable=False),
    sa.Column('orgin_id', sa.Integer(), nullable=False),
    sa.Column('destination_id', sa.Integer(), nullable=False),
    sa.Column('date', sa.Integer(), nullable=False),
    sa.Column('airline', sa.Integer(), nullable=False),
    sa.PrimaryKeyConstraint('id'),
    sa.UniqueConstraint('flight_num')
    )
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('flights')
    # ### end Alembic commands ###